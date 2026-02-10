# ========================================
# GitHub Update Script - Quick Push
# برای آپدیت‌های بعدی
# ========================================

param(
    [string]$message = "Update learning platform"
)

$projectPath = "D:\business\odoo\python-odoo-mastery"
Set-Location $projectPath

Write-Host ""
Write-Host "🔄 Updating GitHub repository..." -ForegroundColor Cyan
Write-Host ""

# Check for changes
$status = git status --porcelain
if (-not $status) {
    Write-Host "✅ No changes to commit" -ForegroundColor Green
    exit 0
}

# Show what's changed
Write-Host "📋 Changes:" -ForegroundColor Yellow
git status --short

Write-Host ""

# Add all changes
Write-Host "📦 Adding all changes..." -ForegroundColor Yellow
git add .

# Commit
Write-Host "💾 Committing changes..." -ForegroundColor Yellow
git commit -m $message

# Push
Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Yellow
git push

Write-Host ""
Write-Host "✅ Successfully updated GitHub repository!" -ForegroundColor Green
Write-Host ""
