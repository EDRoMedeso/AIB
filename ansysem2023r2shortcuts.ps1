<#
Script to copy the Start menu items for Ansys Electronics 2023R2
Love Håkansson 2023-09-22, 2024-01-20
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/ansysem2023r2.zip -OutFile c:\edrm\ansysem2023r2.zip
Expand-Archive -Path c:\edrm\ansysem2023r2.zip -DestinationPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ansys EM Suite 2023 R2' -Force

[Environment]::SetEnvironmentVariable('ANSYSEM_ROOT232', '\\spark\ansysem\v232\win64', 'Machine')
