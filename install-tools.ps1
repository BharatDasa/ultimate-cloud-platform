$ProgressPreference = 'SilentlyContinue'

Write-Host ""
Write-Host "======================================="
Write-Host "ULTIMATE PLATFORM TOOL INSTALLER"
Write-Host "======================================="
Write-Host ""

########################################################

# CREATE TOOLS DIRECTORY

########################################################

New-Item -ItemType Directory -Force -Path "C:\DevOpsTools"

########################################################

# INSTALL KUBECTL

########################################################

Write-Host ""
Write-Host "Installing kubectl..."
Write-Host ""

Invoke-WebRequest `  -Uri "https://dl.k8s.io/release/v1.34.1/bin/windows/amd64/kubectl.exe"`
-OutFile "C:\DevOpsTools\kubectl.exe"

########################################################

# INSTALL HELM

########################################################

Write-Host ""
Write-Host "Installing Helm..."
Write-Host ""

Invoke-WebRequest `  -Uri "https://get.helm.sh/helm-v3.19.0-windows-amd64.zip"`
-OutFile "$env:TEMP\helm.zip"

Expand-Archive `  -Path "$env:TEMP\helm.zip"`
-DestinationPath "$env:TEMP\helm" `
-Force

Copy-Item `  "$env:TEMP\helm\windows-amd64\helm.exe"`
"C:\DevOpsTools\helm.exe"

########################################################

# INSTALL K6

########################################################

Write-Host ""
Write-Host "Installing k6..."
Write-Host ""

Invoke-WebRequest `  -Uri "https://github.com/grafana/k6/releases/download/v1.2.3/k6-v1.2.3-windows-amd64.zip"`
-OutFile "$env:TEMP\k6.zip"

Expand-Archive `  -Path "$env:TEMP\k6.zip"`
-DestinationPath "$env:TEMP\k6" `
-Force

Copy-Item `  "$env:TEMP\k6\k6-v1.2.3-windows-amd64\k6.exe"`
"C:\DevOpsTools\k6.exe"

########################################################

# INSTALL TRIVY

########################################################

Write-Host ""
Write-Host "Installing Trivy..."
Write-Host ""

Invoke-WebRequest `  -Uri "https://github.com/aquasecurity/trivy/releases/download/v0.71.0/trivy_0.71.0_windows-64bit.zip"`
-OutFile "$env:TEMP\trivy.zip"

Expand-Archive `  -Path "$env:TEMP\trivy.zip"`
-DestinationPath "$env:TEMP\trivy" `
-Force

Copy-Item `  "$env:TEMP\trivy\trivy.exe"`
"C:\DevOpsTools\trivy.exe"

C:\DevOpsTools\trivy.exe --version


########################################################

# ADD TO PATH

########################################################

Write-Host ""
Write-Host "Adding tools to PATH..."
Write-Host ""

$currentPath = [Environment]::GetEnvironmentVariable(
"Path",
[EnvironmentVariableTarget]::Machine
)

if ($currentPath -notlike "*C:\DevOpsTools*") {

[Environment]::SetEnvironmentVariable(
"Path",
"$currentPath;C:\DevOpsTools",
[EnvironmentVariableTarget]::Machine
)

}

########################################################

# VERIFY INSTALLATIONS

########################################################

Write-Host ""
Write-Host "======================================="
Write-Host "VERIFYING INSTALLATIONS"
Write-Host "======================================="
Write-Host ""

& "C:\DevOpsTools\kubectl.exe" version --client

Write-Host ""

& "C:\DevOpsTools\helm.exe" version

Write-Host ""

& "C:\DevOpsTools\k6.exe" version

Write-Host ""

& "C:\DevOpsTools\trivy.exe" --version

Write-Host ""
Write-Host "======================================="
Write-Host "INSTALLATION COMPLETED"
Write-Host "======================================="
Write-Host ""

Write-Host "PLEASE RESTART VSCode TERMINAL"
