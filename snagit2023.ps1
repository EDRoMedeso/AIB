<#
Script to install Snagit 2023
Love Håkansson 2023-09-20
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit.mst -OutFile c:\edrm\snagit.mst
Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/snagit.msi -OutFile c:\edrm\snagit.msi

Start-Process -FilePath msiexec -ArgumentList @('/i', 'c:\\edrm\\snagit.msi', 'TRANSFORMS="c:\\edrm\\snagit.mst") -Wait
