<#
Script to install Python 3.12.3
Love Håkansson 2023-10-09, 2024-01-20, 2014-05-17, 2014-09-10
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/python-3.12.6-amd64.exe -OutFile c:\edrm\python-3.12.6-amd64.exe
Start-Process -FilePath c:\edrm\python-3.12.6-amd64.exe -ArgumentList @('/quiet', 'InstallAllUsers=1', 'AppendPath=1', 'Shortcuts=0', 'Include_doc=0') -Wait
