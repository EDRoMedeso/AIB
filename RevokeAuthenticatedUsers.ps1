<#
Script to remove the NTFS permissions for Authenticated Users on C:\
and adding Modify permissions on c:\temp
Love Håkansson 2024-05-22
#>

cmd.exe /c 'icacls c:\\ /remove:g "Authenticated Users"
cmd.exe /c 'icacls c:\\temp /grant:r "Authenticated Users":(CI)(OI)(M)'
