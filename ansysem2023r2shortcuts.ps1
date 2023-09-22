<#
Script to copy the Start menu items for Ansys Electronics 2023R2
Love Håkansson 2023-09-22
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/ansysem.zip\ -OutFile c:\edrm\ansysem.zip
Expand-Archive -Path c:\edrm\ansysem.zip -DestinationPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ansys EM Suite 2023 R2' -Force

[Environment]::SetEnvironmentVariable('ANSYSEM_ROOT232', '\\spark\ansysem\v232\win64', 'Machine')
