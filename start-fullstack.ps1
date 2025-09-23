param(
    [string]$Template
)

Write-Host "`n[INFO] Starting Django + Vite project setup..."

# Backend
Write-Host "[STEP 1/4] Creating Django project..."
if (-not (Test-Path "backend")) {
    mkdir backend > $null
}

django-admin startproject core backend
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Failed to create Django project." -ForegroundColor Red
    exit 1
} else {
    Write-Host "[SUCCESS] Django project created at 'backend/core'."
}

cd backend
Write-Host "[STEP 2/4] Applying initial migrations..."
python manage.py migrate
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Failed to apply migrations." -ForegroundColor Red
    exit 1
} else {
    Write-Host "[SUCCESS] Migrations applied successfully."
}
cd ..

# Frontend
Write-Host "[STEP 3/4] Creating frontend with Vite..."
if ($Template) {
    Write-Host "[INFO] Using template: $Template"
    npm create vite@latest frontend -- --template $Template
} else {
    Write-Host "[INFO] No template specified. Launching interactive setup..."
    npm create vite@latest frontend
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Failed to create Vite project." -ForegroundColor Red
    exit 1
} else {
    Write-Host "[SUCCESS] Vite project created successfully."
}

cd frontend
Write-Host "[STEP 4/4] Installing frontend dependencies..."
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Failed to install dependencies." -ForegroundColor Red
    exit 1
} else {
    Write-Host "[SUCCESS] Dependencies installed successfully."
}

Write-Host "`n[INFO] Django + Vite project setup completed!`n"
cd ..