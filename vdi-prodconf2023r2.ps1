<#
Script for setting up the VDI host image
Love Håkansson 2023-09-13
#>

# Create a temp directory on the VDI host
New-Item -ItemType directory -Path c:\edrm

# Downloading and installing AzCopy
Invoke-WebRequest -Uri https://aka.ms/downloadazcopy-v10-windows -OutFile c:\edrm\AzCopy.zip
Expand-Archive c:\edrm\AzCopy.zip c:\edrm\AzCopy
Get-ChildItem c:\edrm\AzCopy\*\azcopy.exe | Move-Item -Destination C:\edrm\AzCopy.exe

# Fetching the password file for the 'imageInstall' account on \\spark
Start-Process -FilePath C:\edrm\AzCopy.exe -ArgumentList @('login', '--identity') -Wait
Start-Process -FilePath C:\edrm\AzCopy.exe -ArgumentList @('cp', 'https://strgedrm.file.core.windows.net/imagebuilder/password.txt', 'c:\edr\password.txt) -Wait
Start-Process -FilePath C:\edrm\AzCopy.exe -ArgumentList 'logout' -Wait

# Installing Notepad++
Start-Process -FilePath c:\edrm\notepadpp.exe -ArgumentList /S -Wait

# Mounting the ANSYS .iso files
$iso1 = Mount-DiskImage -ImagePath c:\edrm\ANSYS2023R2_WINX64_DISK1.iso -StorageType ISO -PassThru
$iso2 = Mount-DiskImage -ImagePath c:\edrm\ANSYS2023R2_WINX64_DISK2.iso -StorageType ISO -PassThru
$iso3 = Mount-DiskImage -ImagePath c:\edrm\ANSYS2023R2_WINX64_DISK3.iso -StorageType ISO -PassThru
$drive1 = ($iso1 | Get-Volume).DriveLetter
$drive2 = ($iso2 | Get-Volume).DriveLetter
$drive3 = ($iso3 | Get-Volume).DriveLetter

# Building the launch command line
$dir2 = $drive2 + ':\\'
$dir3 = $drive3 + ':\\'
$cmd = $drive1 + ':\\setup.exe'
$argList = @('-silent', '-fluent', '-spaceclaim', '-optislang', '-media_dir2', $dir2, '-media_dir3', $dir3, '-licserverinfo', '2325:1055:rescale-license')

# Installing ANSYS
Start-Process -FilePath $cmd -ArgumentList $argList -Wait

# Unmounting the .iso files
Dismount-DiskImage -ImagePath c:\edrm\ANSYS2023R2_WINX64_DISK1.iso
Dismount-DiskImage -ImagePath c:\edrm\ANSYS2023R2_WINX64_DISK2.iso
Dismount-DiskImage -ImagePath c:\edrm\ANSYS2023R2_WINX64_DISK3.iso

# Removing the entire c:\edrm folder
Remove-Item c:\edrm\ -Recurse -Force
