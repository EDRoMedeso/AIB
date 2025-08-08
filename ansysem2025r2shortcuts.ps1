<#
Script to copy the Start menu items for Ansys Electronics 2025R1
Love Håkansson 2025-08-08
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/ansysem2025r2.zip -OutFile c:\edrm\ansysem2025r2.zip
Expand-Archive -Path c:\edrm\ansysem2025r2.zip -DestinationPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ansys EM Suite 2025 R2' -Force
