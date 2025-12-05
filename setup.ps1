param(
    [switch]$InstallAngularCli
)

function Test-Command($name) {
    $exists = Get-Command $name -ErrorAction SilentlyContinue
    if (-not $exists) { Write-Host "[MISSING] $name" -ForegroundColor Red; return $false }
    Write-Host "[OK] $name" -ForegroundColor Green; return $true
}

Write-Host "Checking prerequisites..." -ForegroundColor Cyan
$dockerOk = Test-Command "docker"
$goOk = Test-Command "go"
$nodeOk = Test-Command "node"
$npmOk = Test-Command "npm"

if (-not $dockerOk) { Write-Host "Install Docker Desktop: https://www.docker.com/products/docker-desktop" }
if (-not $goOk) { Write-Host "Install Go 1.22+: https://go.dev/dl/" }
if (-not ($nodeOk -and $npmOk)) { Write-Host "Install Node.js 20 LTS: https://nodejs.org" }

if ($InstallAngularCli -and $npmOk) {
    Write-Host "Installing Angular CLI globally" -ForegroundColor Cyan
    npm install -g @angular/cli
}

Write-Host "To start dev stack: docker-compose up --build" -ForegroundColor Cyan
Write-Host "Backend BDD tests: (cd backend && go test ./features)" -ForegroundColor Cyan
Write-Host "Frontend e2e tests (requires npm install): (cd frontend && npx playwright test)" -ForegroundColor Cyan
