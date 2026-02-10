# ========================================
# GitHub Upload Script
# پلتفرم آموزشی Python & Odoo Mastery
# ========================================

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  GitHub Upload - Python & Odoo Mastery" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Change to project directory
$projectPath = "D:\business\odoo\python-odoo-mastery"
Set-Location $projectPath

# Check if git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Step 1: Repository Information" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Get repository information
Write-Host ""
Write-Host "📝 Please provide your GitHub repository information:" -ForegroundColor Yellow
Write-Host ""

$githubUsername = Read-Host "GitHub Username"
$repoName = Read-Host "Repository Name"
if (-not $repoName) {
    $repoName = "python-odoo-mastery"
}

Write-Host ""
Write-Host "⚠️  IMPORTANT: Create the repository on GitHub first!" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: $repoName" -ForegroundColor White
Write-Host "3. Description: پلتفرم آموزشی 90 روزه برنامه‌نویسی Odoo" -ForegroundColor White
Write-Host "4. Choose: Public or Private" -ForegroundColor White
Write-Host "5. DO NOT initialize with README (we have one)" -ForegroundColor White
Write-Host ""

$continue = Read-Host "Have you created the repository on GitHub? (y/n)"
if ($continue -ne 'y') {
    Write-Host "Please create the repository first, then run this script again." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Step 2: Git Configuration" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Check if git is already initialized
if (Test-Path ".git") {
    Write-Host "⚠️  Git repository already exists. Removing old .git folder..." -ForegroundColor Yellow
    Remove-Item -Path ".git" -Recurse -Force
}

# Initialize git
Write-Host ""
Write-Host "🔧 Initializing Git repository..." -ForegroundColor Yellow
git init
git branch -M main

# Configure git user (if not already configured globally)
$gitUserName = git config --global user.name
$gitUserEmail = git config --global user.email

if (-not $gitUserName) {
    Write-Host ""
    $userName = Read-Host "Enter your name for Git commits"
    git config --global user.name "$userName"
}

if (-not $gitUserEmail) {
    Write-Host ""
    $userEmail = Read-Host "Enter your email for Git commits"
    git config --global user.email "$userEmail"
}

Write-Host "✅ Git configured successfully" -ForegroundColor Green

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Step 3: Adding Files" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Add all files
Write-Host ""
Write-Host "📦 Adding all files to Git..." -ForegroundColor Yellow
git add .

# Show status
Write-Host ""
Write-Host "📊 Git Status:" -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Step 4: First Commit" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "💾 Creating initial commit..." -ForegroundColor Yellow
git commit -m "🎓 Initial commit: Python & Odoo Mastery Learning Platform

- پلتفرم آموزشی 90 روزه برای تبدیل شدن به برنامه‌نویس حرفه‌ای Odoo
- سیستم تعاملی با Progress Tracking و Gamification
- روز 1: Virtual Environment و PowerShell Essentials کامل شده
- شامل تمرین‌های عملی و آزمون‌های درک مطلب
- مستندات کامل فارسی

Features:
✅ 90 روز برنامه آموزشی ساختاریافته
✅ سطح‌بندی از مبتدی تا حرفه‌ای
✅ تمرین‌های دست‌به‌کلید واقعی
✅ سیستم امتیازدهی و پیشرفت
✅ رابط کاربری زیبا و ریسپانسیو

Tech Stack: HTML5, CSS3, Vanilla JavaScript, localStorage"

Write-Host "✅ Initial commit created" -ForegroundColor Green

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Step 5: Connecting to GitHub" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

# Add remote
$repoUrl = "https://github.com/$githubUsername/$repoName.git"
Write-Host ""
Write-Host "🔗 Adding remote repository..." -ForegroundColor Yellow
Write-Host "Repository URL: $repoUrl" -ForegroundColor White

git remote add origin $repoUrl

Write-Host "✅ Remote added successfully" -ForegroundColor Green

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Step 6: Pushing to GitHub" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Yellow
Write-Host ""
Write-Host "⚠️  You may need to authenticate:" -ForegroundColor Yellow
Write-Host "- If using HTTPS: Enter your GitHub Personal Access Token (not password!)" -ForegroundColor White
Write-Host "- To create a token: https://github.com/settings/tokens" -ForegroundColor White
Write-Host "  - Click 'Generate new token (classic)'" -ForegroundColor White
Write-Host "  - Select scope: 'repo' (full control of private repositories)" -ForegroundColor White
Write-Host "  - Copy the token and paste it here when prompted" -ForegroundColor White
Write-Host ""

# Push to GitHub
try {
    git push -u origin main
    
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Green
    Write-Host "  ✅ SUCCESS! Repository uploaded!" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 Your learning platform is now on GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📍 Repository URL:" -ForegroundColor Cyan
    Write-Host "   https://github.com/$githubUsername/$repoName" -ForegroundColor White
    Write-Host ""
    Write-Host "📍 View online:" -ForegroundColor Cyan
    Write-Host "   https://$githubUsername.github.io/$repoName" -ForegroundColor White
    Write-Host "   (Enable GitHub Pages in repository settings)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "  Next Steps" -ForegroundColor Cyan
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Enable GitHub Pages:" -ForegroundColor Yellow
    Write-Host "   - Go to repository Settings > Pages" -ForegroundColor White
    Write-Host "   - Source: Deploy from branch 'main'" -ForegroundColor White
    Write-Host "   - Folder: / (root)" -ForegroundColor White
    Write-Host "   - Save" -ForegroundColor White
    Write-Host ""
    Write-Host "2. Share with others:" -ForegroundColor Yellow
    Write-Host "   - Send them the GitHub Pages URL" -ForegroundColor White
    Write-Host "   - They can learn from your platform" -ForegroundColor White
    Write-Host ""
    Write-Host "3. Continue learning:" -ForegroundColor Yellow
    Write-Host "   - Complete Day 1 exercises" -ForegroundColor White
    Write-Host "   - Come back tomorrow for Day 2" -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "============================================" -ForegroundColor Red
    Write-Host "  ❌ Error during push" -ForegroundColor Red
    Write-Host "============================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Error: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Common solutions:" -ForegroundColor Yellow
    Write-Host "1. Make sure you created the repository on GitHub" -ForegroundColor White
    Write-Host "2. Check your internet connection" -ForegroundColor White
    Write-Host "3. Verify your GitHub username and repository name" -ForegroundColor White
    Write-Host "4. If using HTTPS, make sure you're using a Personal Access Token, not your password" -ForegroundColor White
    Write-Host ""
    Write-Host "To try again:" -ForegroundColor Yellow
    Write-Host "   git push -u origin main" -ForegroundColor White
    Write-Host ""
}

Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
