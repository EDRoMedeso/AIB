<#
Script to copy the Start menu items for Ansys Electronics 2024R1
Love Håkansson 2024-01-20
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/ansysem2024r1.zip -OutFile c:\edrm\ansysem2024r1.zip
Expand-Archive -Path c:\edrm\ansysem2024r1.zip -DestinationPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ansys EM Suite 2024 R1' -Force

[Environment]::SetEnvironmentVariable('ANSYSEM_ROOT241', '\\spark\ansysem\v241\win64', 'Machine')
