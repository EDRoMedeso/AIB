<#
Script to copy the Start menu items for Ansys Electronics 2024R2
Love Håkansson 2024-09-10
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/ansysem2024r2.zip -OutFile c:\edrm\ansysem2024r2.zip
Expand-Archive -Path c:\edrm\ansysem2024r2.zip -DestinationPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ansys EM Suite 2024 R2' -Force

[Environment]::SetEnvironmentVariable('ANSYSEM_ROOT242', '\\spark\ansysem\v242\win64', 'Machine')
