# 🚀 راهنمای آپلود به GitHub
## پلتفرم آموزشی Python & Odoo Mastery

---

## ✅ مرحله 1: آماده‌سازی

### نصب Git (اگر نصب نیست):

1. دانلود از: https://git-scm.com/download/win
2. نصب با تنظیمات پیش‌فرض
3. بازنشانی PowerShell

---

## 🎯 مرحله 2: ساخت Repository در GitHub

### گام به گام:

1. **وارد GitHub شوید**: https://github.com

2. **ساخت Repository جدید**:
   - کلیک روی `+` در گوشه بالا
   - انتخاب `New repository`

3. **تنظیمات Repository**:
   ```
   Repository name: python-odoo-mastery
   Description: پلتفرم آموزشی 90 روزه برنامه‌نویسی حرفه‌ای Odoo
   Public ✅ (یا Private اگر می‌خواهید خصوصی باشد)
   
   ❌ DO NOT check "Initialize this repository with a README"
   ❌ DO NOT add .gitignore
   ❌ DO NOT choose a license yet
   ```

4. **کلیک روی "Create repository"**

5. **صفحه خالی را ببینید** - نگران نباشید، درست است!

---

## 🔑 مرحله 3: ساخت Personal Access Token

### چرا نیاز است؟
GitHub دیگر از password معمولی پشتیبانی نمی‌کند. باید Token استفاده کنید.

### چطور بسازیم؟

1. **در GitHub**:
   - Settings (گوشه بالا راست، روی avatar کلیک کنید)
   - Developer settings (آخرین گزینه سمت چپ)
   - Personal access tokens
   - Tokens (classic)
   - Generate new token (classic)

2. **تنظیمات Token**:
   ```
   Note: Python Odoo Mastery Upload
   Expiration: 90 days (یا بیشتر)
   
   Scopes (دسترسی‌ها):
   ✅ repo (تیک بزنید - همه زیرمجموعه‌ها فعال می‌شوند)
   ```

3. **Generate token** را بزنید

4. **⚠️ IMPORTANT**: Token را کپی کنید!
   ```
   مثال: ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   ```
   
   **هشدار**: این token را **فقط یکبار** می‌بینید! 
   - در جایی امن ذخیره کنید (Notepad)
   - بعداً برای push نیاز دارید

---

## 🚀 مرحله 4: اجرای اسکریپت آپلود

### روش 1: اجرای اتوماتیک (توصیه می‌شود)

```powershell
# در PowerShell:
cd "D:\business\odoo\python-odoo-mastery"
.\upload-to-github.ps1
```

### اسکریپت از شما می‌پرسد:

1. **GitHub Username**: (مثال: `ahmad_developer`)
2. **Repository Name**: `python-odoo-mastery`
3. **آیا repository ساختید؟**: `y`
4. **نام شما**: (برای Git commits)
5. **ایمیل شما**: (برای Git commits)

### هنگام Push:

وقتی خواست authentication کند:
```
Username: username_github_شما
Password: ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx (Token شما)
```

**نکته**: Password نیست، همان Token است که کپی کردید!

---

## ✅ مرحله 5: فعال‌سازی GitHub Pages

بعد از آپلود موفق:

1. **وارد Repository شوید**: 
   ```
   https://github.com/username_شما/python-odoo-mastery
   ```

2. **Settings** (تب بالا)

3. **Pages** (منوی چپ)

4. **تنظیمات**:
   ```
   Source: Deploy from a branch
   Branch: main
   Folder: / (root)
   ```

5. **Save** را بزنید

6. **منتظر بمانید 2-3 دقیقه**

7. **لینک فعال می‌شود**:
   ```
   https://username_شما.github.io/python-odoo-mastery
   ```

---

## 📊 روش 2: دستی (اگر اسکریپت کار نکرد)

### گام به گام:

```powershell
# 1. رفتن به پوشه پروژه
cd "D:\business\odoo\python-odoo-mastery"

# 2. Initialize Git
git init
git branch -M main

# 3. تنظیم Git user
git config --global user.name "نام شما"
git config --global user.email "email@example.com"

# 4. اضافه کردن فایل‌ها
git add .

# 5. Commit اولیه
git commit -m "Initial commit: Python & Odoo Mastery"

# 6. اضافه کردن remote
git remote add origin https://github.com/username_شما/python-odoo-mastery.git

# 7. Push به GitHub
git push -u origin main
```

**هنگام push**:
- Username: `username_github_شما`
- Password: `ghp_xxxxx...` (Token شما)

---

## 🔄 آپدیت‌های بعدی

### وقتی روزهای بعدی را اضافه کردید:

```powershell
cd "D:\business\odoo\python-odoo-mastery"
.\update-github.ps1 "Add Day 2: PowerShell Essentials"
```

یا دستی:

```powershell
git add .
git commit -m "Add Day 2 content"
git push
```

---

## ❗ رفع مشکلات رایج

### ❌ خطا: "Git is not recognized"

**راه حل**:
1. Git نصب نیست → نصب کنید
2. یا از مسیر کامل استفاده کنید:
   ```powershell
   & "C:\Program Files\Git\bin\git.exe" --version
   ```

### ❌ خطا: "Authentication failed"

**راه حل**:
- مطمئن شوید Token را درست کپی کردید
- Token منقضی نشده باشد
- در قسمت Password از Token استفاده کنید (نه password حساب)

### ❌ خطا: "Repository not found"

**راه حل**:
- Repository در GitHub ساخته شده؟
- نام repository و username درست است؟
- Repository Public است یا Private با دسترسی مناسب؟

### ❌ خطا: "Updates were rejected"

**راه حل**:
```powershell
# اگر repository در GitHub فایلی دارد که شما ندارید:
git pull origin main --rebase
git push origin main
```

### ❌ خطا: "Permission denied"

**راه حل**:
- Token شما scope `repo` را دارد؟
- Token منقضی نشده؟
- Token را دوباره بسازید

---

## 🌐 اشتراک‌گذاری پلتفرم

### بعد از فعال‌سازی GitHub Pages:

1. **لینک مستقیم**:
   ```
   https://username_شما.github.io/python-odoo-mastery
   ```

2. **اضافه کردن به README**:
   - Edit کنید `README.md`
   - این خط را اضافه کنید:
     ```markdown
     ## 🌐 دمو آنلاین
     [مشاهده پلتفرم](https://username_شما.github.io/python-odoo-mastery)
     ```

3. **اشتراک با دیگران**:
   - لینک GitHub Pages را بفرستید
   - آن‌ها بدون نیاز به Git می‌توانند استفاده کنند

---

## 💡 نکات مهم

### ✅ انجام دهید:

1. **Token را امن نگه دارید**
   - در password manager ذخیره کنید
   - به کسی ندهید

2. **Commit های معنادار**
   ```
   ✅ "Add Day 2: PowerShell Essentials"
   ❌ "update"
   ```

3. **قبل از Push بررسی کنید**
   ```powershell
   git status
   git log --oneline -5
   ```

### ❌ انجام ندهید:

1. **Token را commit نکنید**
   - اگر اشتباهی commit شد، فوراً آن را revoke کنید

2. **فایل‌های حساس**
   - پسوردها
   - API keys
   - اطلاعات شخصی

3. **Force push**
   ```powershell
   # خطرناک است! از این استفاده نکنید:
   git push --force
   ```

---

## 🎯 چک‌لیست نهایی

قبل از اجرای اسکریپت مطمئن شوید:

- [ ] Git نصب شده است
- [ ] Repository در GitHub ساخته شده
- [ ] Personal Access Token ساخته و کپی شده
- [ ] Token scope `repo` را دارد
- [ ] Username و Repository name را می‌دانید
- [ ] PowerShell به عنوان Administrator باز نیست (نیازی نیست)

---

## 📞 نیاز به کمک؟

### اگر مشکلی پیش آمد:

1. خطا را کامل بخوانید
2. در بخش "رفع مشکلات" بالا جستجو کنید
3. Google کنید: "git [پیام خطا]"
4. سؤال در Stack Overflow بپرسید

### منابع مفید:

- Git Documentation: https://git-scm.com/doc
- GitHub Guides: https://guides.github.com
- GitHub Pages: https://pages.github.com

---

**🚀 آماده‌اید؟ اسکریپت را اجرا کنید:**

```powershell
cd "D:\business\odoo\python-odoo-mastery"
.\upload-to-github.ps1
```

**موفق باشید! 🎉**
