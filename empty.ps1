Get-ChildItem -Path c:\
# Create a temp directory on the VDI host
New-Item -ItemType directory -Path c:\temp

# Downloading and installing AzCopy
Invoke-WebRequest -Uri https://aka.ms/downloadazcopy-v10-windows -OutFile c:\temp\AzCopy.zip
Expand-Archive c:\temp\AzCopy.zip c:\temp\AzCopy
Get-ChildItem c:\temp\AzCopy\*\azcopy.exe | Move-Item -Destination C:\temp\AzCopy.exe

Start-Process -FilePath C:\temp\AzCopy.exe -ArgumentList @('login', '--identity') -Wait
Start-Process -FilePath C:\temp\AzCopy.exe -ArgumentList @('cp', 'https://strgvdi.blob.core.windows.net/image-software/npp.8.5.6.Installer.x64.exe', '--from-to BlobPipe') -RedirectStandardOutput c:\temp\notepadpp.exe -Wait
