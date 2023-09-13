# This script installs the Az PowerShell module

# Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Bypass -Force
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Az
