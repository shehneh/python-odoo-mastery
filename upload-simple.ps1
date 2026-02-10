# Simple GitHub Upload Script
# Python & Odoo Mastery Platform

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  GitHub Upload - Python & Odoo Mastery" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Check Git
$gitVersion = git --version
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}
Write-Host "Git found: $gitVersion" -ForegroundColor Green
Write-Host ""

# Get repository information
Write-Host "Enter your GitHub username:"
$githubUsername = Read-Host
Write-Host ""

Write-Host "Enter repository name (or press Enter for 'python-odoo-mastery'):"
$repoName = Read-Host
if (-not $repoName) {
    $repoName = "python-odoo-mastery"
}
Write-Host ""

Write-Host "Repository: https://github.com/$githubUsername/$repoName" -ForegroundColor Cyan
Write-Host ""

# Confirm repository creation
Write-Host "IMPORTANT: Have you created this repository on GitHub? (y/n):" -ForegroundColor Yellow
$confirmation = Read-Host
if ($confirmation -ne 'y') {
    Write-Host ""
    Write-Host "Please create the repository first:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://github.com/new"
    Write-Host "2. Repository name: $repoName"
    Write-Host "3. Choose Public or Private"
    Write-Host "4. DO NOT initialize with README"
    Write-Host ""
    Start-Process "https://github.com/new"
    exit 0
}

Write-Host ""
Write-Host "Starting upload process..." -ForegroundColor Green
Write-Host ""

# Initialize Git repository
Write-Host "Step 1/6: Checking Git repository..." -ForegroundColor Yellow
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Cyan
    git init
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to initialize Git repository" -ForegroundColor Red
        exit 1
    }
    Write-Host "Git repository initialized" -ForegroundColor Green
} else {
    Write-Host "Git repository already exists" -ForegroundColor Green
}
Write-Host ""

# Configure Git
Write-Host "Step 2/6: Configuring Git..." -ForegroundColor Yellow
git config user.name "$githubUsername"
git config user.email "$githubUsername@users.noreply.github.com"
Write-Host "Git configured" -ForegroundColor Green
Write-Host ""

# Add files
Write-Host "Step 3/6: Adding files..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to add files" -ForegroundColor Red
    exit 1
}
Write-Host "Files added to Git" -ForegroundColor Green
Write-Host ""

# Commit
Write-Host "Step 4/6: Creating commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Python & Odoo Mastery - Day 1"
if ($LASTEXITCODE -ne 0) {
    Write-Host "WARNING: Commit failed (maybe no changes?)" -ForegroundColor Yellow
}
Write-Host ""

# Add remote
Write-Host "Step 5/6: Adding remote repository..." -ForegroundColor Yellow
$remoteUrl = "https://github.com/$githubUsername/$repoName.git"

# Remove existing remote if it exists
git remote remove origin 2>$null

git remote add origin $remoteUrl
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to add remote" -ForegroundColor Red
    exit 1
}
Write-Host "Remote repository added" -ForegroundColor Green
Write-Host ""

# Push to GitHub
Write-Host "Step 6/6: Pushing to GitHub..." -ForegroundColor Yellow
Write-Host ""
Write-Host "IMPORTANT: When prompted for password, paste your Personal Access Token" -ForegroundColor Yellow
Write-Host ""

git push -u origin main
if ($LASTEXITCODE -ne 0) {
    # Try master branch if main failed
    Write-Host "Trying 'master' branch..." -ForegroundColor Cyan
    git branch -M main
    git push -u origin main
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "ERROR: Push failed" -ForegroundColor Red
        Write-Host "Please check:" -ForegroundColor Yellow
        Write-Host "1. Repository exists on GitHub"
        Write-Host "2. Personal Access Token is correct"
        Write-Host "3. Token has 'repo' permissions"
        exit 1
    }
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "  SUCCESS! Project uploaded to GitHub" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Repository URL:" -ForegroundColor Cyan
Write-Host "https://github.com/$githubUsername/$repoName" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/$githubUsername/$repoName/settings/pages"
Write-Host "2. Under 'Source', select 'main' branch"
Write-Host "3. Click 'Save'"
Write-Host "4. Your site will be available at:"
Write-Host "   https://$githubUsername.github.io/$repoName"
Write-Host ""
Write-Host "To update in the future, use: .\update-github.ps1" -ForegroundColor Cyan
Write-Host ""
