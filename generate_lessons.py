#!/usr/bin/env python3
"""
Auto-generate remaining lessons for Python & Odoo Mastery course
Level 0: Critical Fundamentals (Days 4-10)
"""

import os

# Lesson templates
lessons = [
    {
        "day": 4,
        "title": "Debugging Workflow و ابزارها",
        "file": "day04-debugging-workflow.html",
        "emoji": "🐛",
        "objectives": [
            "آشنایی با Python Debugger (pdb)",
            "استفاده از VS Code Debugger",
            "Breakpoints و Watch variables",
            "Stack trace و error analysis",
            "Logging برای troubleshooting"
        ],
        "topics": [
            ("پایه Debugging", "print() debugging - ساده اما مؤثر"),
            ("Python pdb", "استفاده از built-in debugger"),
            ("VS Code Debugger", "debugging گرافیکی و حرفه‌ای"),
            ("Logging Module", "ثبت log برای production"),
            ("Common Errors", "خطاهای رایج و راه‌حل آن‌ها")
        ],
        "practice": "Debug کردن یک کد Odoo که خطا دارد"
    },
    {
        "day": 5,
        "title": "Python Data Types - عمیق",
        "file": "day05-python-data-types.html",
        "emoji": "🔢",
        "objectives": [
            "درک عمیق int, float, bool, None",
            "Type conversion و casting",
            "Memory management و mutability",
            "Type hints در Python 3.9+",
            "isinstance() vs type()"
        ],
        "topics": [
            ("Numbers", "int, float, complex, decimal"),
            ("Booleans", "True, False, truthy/falsy values"),
            ("None Type", "استفاده درست از None"),
            ("Type Hints", "annotations برای code quality"),
            ("Type Conversion", "int(), str(), float(), bool()")
        ],
        "practice": "ساخت یک calculator با type hints"
    },
    {
        "day": 6,
        "title": "String Manipulation & Encoding",
        "file": "day06-string-manipulation.html",
        "emoji": "📝",
        "objectives": [
            "String methods و manipulation",
            "f-strings و formatting",
            "Unicode و encoding (UTF-8)",
            "Regular expressions پایه",
            "String validation"
        ],
        "topics": [
            ("String Basics", "immutability, indexing, slicing"),
            ("String Methods", "upper(), lower(), strip(), split(), join()"),
            ("Formatting", "f-strings, format(), %"),
            ("Encoding", "UTF-8, decode(), encode()"),
            ("Regex", "re module برای pattern matching")
        ],
        "practice": "پردازش فارسی و اعتبارسنجی input"
    },
    {
        "day": 7,
        "title": "Collections - List, Dict, Set",
        "file": "day07-collections.html",
        "emoji": "📦",
        "objectives": [
            "List comprehensions و methods",
            "Dictionary operations",
            "Set theory و operations",
            "Tuple vs List",
            "Collections module"
        ],
        "topics": [
            ("Lists", "append, extend, pop, comprehensions"),
            ("Dictionaries", "keys, values, items, get(), setdefault()"),
            ("Sets", "union, intersection, difference"),
            ("Tuples", "immutability, unpacking"),
            ("Collections", "defaultdict, Counter, namedtuple")
        ],
        "practice": "ساخت یک data processor با collections"
    },
    {
        "day": 8,
        "title": "Functions & Scope",
        "file": "day08-functions-scope.html",
        "emoji": "⚡",
        "objectives": [
            "تعریف و فراخوانی توابع",
            "Parameters: positional, keyword, default",
            "*args و **kwargs",
            "Scope: local, global, nonlocal",
            "Lambda functions"
        ],
        "topics": [
            ("Function Basics", "def, return, docstrings"),
            ("Parameters", "positional, keyword, default values"),
            ("*args/**kwargs", "variable arguments"),
            ("Scope", "LEGB rule: Local, Enclosing, Global, Built-in"),
            ("Lambda", "anonymous functions")
        ],
        "practice": "ساخت utility functions برای Odoo"
    },
    {
        "day": 9,
        "title": "File I/O & Path Handling",
        "file": "day09-file-io.html",
        "emoji": "📁",
        "objectives": [
            "خواندن و نوشتن فایل‌ها",
            "Context managers (with)",
            "pathlib برای path manipulation",
            "کار با CSV و JSON",
            "File operations (copy, move, delete)"
        ],
        "topics": [
            ("File Operations", "open(), read(), write(), close()"),
            ("Context Managers", "with statement"),
            ("pathlib", "Path class برای cross-platform paths"),
            ("CSV & JSON", "خواندن و نوشتن structured data"),
            ("shutil", "high-level file operations")
        ],
        "practice": "خواندن backup files و پردازش JSON"
    },
    {
        "day": 10,
        "title": "Exception Handling حرفه‌ای",
        "file": "day10-exception-handling.html",
        "emoji": "🔥",
        "objectives": [
            "try/except/finally/else",
            "Exception hierarchy",
            "Raising exceptions",
            "Custom exceptions",
            "Best practices"
        ],
        "topics": [
            ("Try/Except", "catching و handling errors"),
            ("Exception Types", "ValueError, TypeError, KeyError, etc."),
            ("Finally/Else", "cleanup code"),
            ("Raising", "raise custom exceptions"),
            ("Custom Exceptions", "ساخت exception classes")
        ],
        "practice": "Error handling برای Odoo module"
    }
]

def generate_lesson_html(lesson):
    """Generate HTML content for a lesson"""
    
    objectives_html = "\n                ".join([f"<li>{obj}</li>" for obj in lesson['objectives']])
    
    topics_html = ""
    for i, (title, desc) in enumerate(lesson['topics'], 1):
        topics_html += f"""
        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; margin: 1.5rem 0; border: 2px solid #e2e8f0;">
            <h3>{i}️⃣ {title}</h3>
            <p>{desc}</p>
            <div style="background: #1e293b; color: #e2e8f0; padding: 1.5rem; border-radius: 8px; font-family: 'Fira Code', monospace; margin: 1rem 0; direction: ltr; text-align: left;">
<span style="color: #94a3b8;"># نمونه کد - این قسمت باید دستی پر شود</span>
<span style="color: #60a5fa;">print</span>(<span style="color: #34d399;">"Hello {title}"</span>)
            </div>
        </div>
"""
    
    html = f"""<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>روز {lesson['day']}: {lesson['title']} | Python & Odoo Mastery 🎓</title>
    <link rel="stylesheet" href="../assets/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;600;700&family=Fira+Code:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="lesson-content" style="max-width: 900px; margin: 2rem auto; padding: 0 2rem;">
        <h1 style="text-align: center; color: #1f2937;">{lesson['emoji']} روز {lesson['day']}: {lesson['title']}</h1>
        
        <div style="background: #d1fae5; border-right: 4px solid #10b981; padding: 1.5rem; border-radius: 8px; margin: 2rem 0;">
            <h3>🎯 اهداف یادگیری</h3>
            <ul>
                {objectives_html}
            </ul>
        </div>

        <h2>📚 مباحث اصلی</h2>
        
        {topics_html}

        <h2>🧪 تمرین عملی</h2>

        <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 2rem; border-radius: 12px; margin: 2rem 0;">
            <h3>📝 تمرین: {lesson['practice']}</h3>
            <p>این تمرین را انجام دهید و کد خود را در GitHub قرار دهید.</p>
            
            <button onclick="document.getElementById('ex-solution').style.display='block'" style="background: white; color: #667eea; padding: 0.75rem 1.5rem; border: none; border-radius: 8px; font-weight: 600; cursor: pointer; margin-top: 1rem;">
                💡 مشاهده راه‌حل
            </button>
            
            <div id="ex-solution" style="display: none; background: rgba(0,0,0,0.3); padding: 1.5rem; border-radius: 8px; margin-top: 1rem; font-family: 'Fira Code', monospace;">
<span style="color: #94a3b8;"># راه‌حل تمرین - این قسمت باید دستی تکمیل شود</span>
print("راه‌حل در حال تکمیل...")
            </div>
        </div>

        <h2>📝 آزمون</h2>

        <div style="background: #f8fafc; padding: 1.5rem; border-radius: 12px; margin: 1.5rem 0; border: 2px solid #e2e8f0;">
            <h3>سؤال 1: مفهوم اصلی این درس چیست؟</h3>
            <div class="quiz-option" onclick="checkAnswer(1, 'A', false)" style="background: white; padding: 1rem; margin: 0.5rem 0; border-radius: 8px; cursor: pointer;">A) گزینه 1</div>
            <div class="quiz-option" onclick="checkAnswer(1, 'B', true)" style="background: white; padding: 1rem; margin: 0.5rem 0; border-radius: 8px; cursor: pointer;">B) گزینه صحیح</div>
            <div class="quiz-option" onclick="checkAnswer(1, 'C', false)" style="background: white; padding: 1rem; margin: 0.5rem 0; border-radius: 8px; cursor: pointer;">C) گزینه 3</div>
        </div>

        <button onclick="markComplete()" style="background: #3b82f6; color: white; padding: 1rem 2rem; border: none; border-radius: 8px; font-size: 1.1rem; font-weight: 600; cursor: pointer; width: 100%; margin: 1.5rem 0;">
            ✅ تکمیل کردن روز {lesson['day']}
        </button>

        <div style="display: flex; justify-content: space-between; margin: 3rem 0; gap: 1rem;">
            <a href="day{lesson['day']-1:02d}-*.html" style="padding: 1rem 2rem; background: #e2e8f0; color: #1f2937; text-decoration: none; border-radius: 8px; font-weight: 600;">← روز قبل</a>
            <a href="../index.html" style="padding: 1rem 2rem; background: #3b82f6; color: white; text-decoration: none; border-radius: 8px; font-weight: 600;">صفحه اصلی →</a>
        </div>
    </div>

    <script>
        const answers = {{}};
        const correctAnswers = {{1: 'B'}};

        function checkAnswer(q, selected) {{
            const options = event.target.parentElement.querySelectorAll('.quiz-option');
            options.forEach(opt => opt.style.borderColor = 'transparent');
            
            answers[q] = selected;
            
            if (selected === correctAnswers[q]) {{
                event.target.style.background = '#d1fae5';
                event.target.style.borderColor = '#10b981';
            }} else {{
                event.target.style.background = '#fee2e2';
                event.target.style.borderColor = '#ef4444';
            }}
        }}

        function markComplete() {{
            localStorage.setItem('lesson_day{lesson['day']:02d}_complete', 'true');
            alert('🎉 تبریک! روز {lesson['day']} تکمیل شد.');
            event.target.textContent = '✅ تکمیل شده';
            event.target.disabled = true;
            event.target.style.background = '#10b981';
        }}

        window.addEventListener('load', () => {{
            if (localStorage.getItem('lesson_day{lesson['day']:02d}_complete') === 'true') {{
                const btn = document.querySelector('button[onclick="markComplete()"]');
                if (btn) {{
                    btn.textContent = '✅ تکمیل شده';
                    btn.disabled = true;
                    btn.style.background = '#10b981';
                }}
            }}
        }});
    </script>
</body>
</html>
"""
    return html

# Generate all lessons
output_dir = r"D:\business\odoo\python-odoo-mastery\lessons"

for lesson in lessons:
    filepath = os.path.join(output_dir, lesson['file'])
    html_content = generate_lesson_html(lesson)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"✅ Created: {lesson['file']}")

print(f"\n🎉 Successfully generated {len(lessons)} lessons!")
print("\n📝 Note: Code examples and quiz questions need to be filled in manually.")
