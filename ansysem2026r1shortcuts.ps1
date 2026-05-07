<#
Script to copy the Start menu items for Ansys Electronics 2026R1
Love Håkansson 2026-05-07
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/ansysem2026r1.zip -OutFile c:\edrm\ansysem2026r1.zip
Expand-Archive -Path c:\edrm\ansysem2026r1.zip -DestinationPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Ansys EM Suite 2026 R1' -Force
