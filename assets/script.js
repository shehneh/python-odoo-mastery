/**
 * Python & Odoo Mastery - Learning Platform
 * Interactive Features & Progress Tracking
 */

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    initializeDates();
    loadProgress();
    setupEventListeners();
    updateStats();
});

// Set dates
function initializeDates() {
    const today = new Date();
    const endDate = new Date(today);
    endDate.setDate(today.getDate() + 90);
    
    const formatDate = (date) => {
        return date.toLocaleDateString('fa-IR', { 
            year: 'numeric', 
            month: 'long', 
            day: 'numeric' 
        });
    };
    
    document.querySelectorAll('.footer p')[0].innerHTML = 
        document.querySelectorAll('.footer p')[0].innerHTML
            .replace('{{ today }}', formatDate(today))
            .replace('{{ 90days }}', formatDate(endDate));
}

// Setup event listeners
function setupEventListeners() {
    const calculateBtn = document.getElementById('calculateLevel');
    if (calculateBtn) {
        calculateBtn.addEventListener('click', calculateLevel);
    }
    
    // Auto-save skill checks
    document.querySelectorAll('.skill-check').forEach(checkbox => {
        checkbox.addEventListener('change', saveProgress);
    });
}

// Calculate user level based on skills
function calculateLevel() {
    const checkboxes = document.querySelectorAll('.skill-check:checked');
    const totalSkills = document.querySelectorAll('.skill-check').length;
    const checkedSkills = checkboxes.length;
    const percentage = (checkedSkills / totalSkills) * 100;
    
    let level, title, description, recommendation;
    
    if (percentage === 0) {
        level = "Level 0";
        title = "مبتدی - شروع مسیر";
        description = "شما در ابتدای مسیر هستید. نگران نباشید! همه از همین‌جا شروع کرده‌اند.";
        recommendation = "توصیه: از روز 1 به ترتیب شروع کنید و هر روز حداقل 1 ساعت تمرین کنید.";
    } else if (percentage < 25) {
        level = "Level 0-1";
        title = "مبتدی با پیشرفت";
        description = `شما ${Math.round(percentage)}% مهارت‌های پایه را دارید. در مسیر درستی هستید!`;
        recommendation = "توصیه: بر روی مبانی Python و PowerShell تمرکز کنید.";
    } else if (percentage < 50) {
        level = "Level 1";
        title = "پیشرفته مقدماتی";
        description = `شما ${Math.round(percentage)}% مهارت‌ها را دارید. خیلی خوب پیش می‌روید!`;
        recommendation = "توصیه: وقت آن است که به OOP و Database متمرکز شوید.";
    } else if (percentage < 75) {
        level = "Level 2";
        title = "متوسط به بالا";
        description = `شما ${Math.round(percentage)}% مهارت‌ها را دارید. شما آماده Odoo Development هستید!`;
        recommendation = "توصیه: شروع به ساخت پروژه‌های Odoo کنید.";
    } else if (percentage < 100) {
        level = "Level 3";
        title = "پیشرفته";
        description = `شما ${Math.round(percentage)}% مهارت‌ها را دارید. شما یک توسعه‌دهنده ماهر هستید!`;
        recommendation = "توصیه: بر روی Performance و Production Best Practices کار کنید.";
    } else {
        level = "Level 4";
        title = "استاد";
        description = "تبریک! شما تمام مهارت‌های لازم را دارید!";
        recommendation = "توصیه: وقت آن است که دانش خود را با دیگران به اشتراک بگذارید!";
    }
    
    const resultDiv = document.getElementById('levelResult');
    resultDiv.innerHTML = `
        <h3>🎯 سطح شما: ${level}</h3>
        <h4>${title}</h4>
        <p>${description}</p>
        <p><strong>${recommendation}</strong></p>
        <div style="margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid rgba(255,255,255,0.3);">
            <p><strong>مهارت‌های تسلط یافته:</strong> ${checkedSkills} از ${totalSkills}</p>
            <div style="background: rgba(255,255,255,0.2); height: 20px; border-radius: 10px; margin-top: 0.5rem; overflow: hidden;">
                <div style="background: white; height: 100%; width: ${percentage}%; transition: width 0.5s;"></div>
            </div>
        </div>
    `;
    resultDiv.style.display = 'block';
    
    // Update current level display
    document.getElementById('currentLevel').textContent = level;
    
    // Scroll to result
    resultDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
    
    saveProgress();
}

// Save progress to localStorage
function saveProgress() {
    const progress = {
        skills: {},
        completedLessons: 0,
        totalPoints: 0,
        lastUpdated: new Date().toISOString()
    };
    
    document.querySelectorAll('.skill-check').forEach(checkbox => {
        progress.skills[checkbox.dataset.skill] = checkbox.checked;
    });
    
    // Count completed lessons
    progress.completedLessons = document.querySelectorAll('.lesson-item.completed').length;
    
    // Calculate points (10 points per skill, 50 per lesson)
    const checkedSkills = Object.values(progress.skills).filter(v => v).length;
    progress.totalPoints = (checkedSkills * 10) + (progress.completedLessons * 50);
    
    localStorage.setItem('odoo_mastery_progress', JSON.stringify(progress));
    updateStats();
}

// Load progress from localStorage
function loadProgress() {
    const saved = localStorage.getItem('odoo_mastery_progress');
    if (!saved) return;
    
    const progress = JSON.parse(saved);
    
    // Restore checkboxes
    Object.entries(progress.skills).forEach(([skill, checked]) => {
        const checkbox = document.querySelector(`[data-skill="${skill}"]`);
        if (checkbox) checkbox.checked = checked;
    });
    
    updateStats();
}

// Update statistics display
function updateStats() {
    const checkedSkills = document.querySelectorAll('.skill-check:checked').length;
    const totalSkills = document.querySelectorAll('.skill-check').length;
    const completedLessons = document.querySelectorAll('.lesson-item.completed').length;
    const totalPoints = (checkedSkills * 10) + (completedLessons * 50);
    
    const completedEl = document.getElementById('completedLessons');
    const pointsEl = document.getElementById('totalPoints');
    
    if (completedEl) {
        animateNumber(completedEl, parseInt(completedEl.textContent) || 0, completedLessons);
    }
    if (pointsEl) {
        animateNumber(pointsEl, parseInt(pointsEl.textContent) || 0, totalPoints);
    }
}

// Animate number changes
function animateNumber(element, from, to, duration = 1000) {
    const start = Date.now();
    const range = to - from;
    
    function update() {
        const now = Date.now();
        const progress = Math.min((now - start) / duration, 1);
        const easeOutQuad = progress * (2 - progress); // Easing function
        const current = Math.round(from + (range * easeOutQuad));
        
        element.textContent = current;
        
        if (progress < 1) {
            requestAnimationFrame(update);
        }
    }
    
    update();
}

// Mark lesson as completed (called from lesson pages)
function markLessonComplete(dayNumber) {
    const lessonItem = document.querySelector(`.lesson-item .lesson-number:contains("${dayNumber}")`);
    if (lessonItem) {
        lessonItem.closest('.lesson-item').classList.add('completed');
        saveProgress();
    }
}

// Export for use in lesson pages
window.masteryPlatform = {
    markLessonComplete,
    saveProgress,
    updateStats
};

// Smooth scroll for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    });
});

// Add progress indicator on scroll
let lastScroll = 0;
window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    const currentScroll = window.pageYOffset;
    
    if (currentScroll > 100) {
        navbar.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
    } else {
        navbar.style.boxShadow = '0 1px 3px rgba(0,0,0,0.1)';
    }
    
    lastScroll = currentScroll;
});

console.log('🎓 Python & Odoo Mastery Platform Loaded!');
console.log('💡 هر روز یک قدم به جلو. شما می‌توانید!');