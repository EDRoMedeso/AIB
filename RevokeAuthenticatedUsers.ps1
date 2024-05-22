cmd.exe /c 'icacls c:\\ /remove:g "Authenticated Users"
cmd.exe /c 'icacls c:\\temp /grant:r "Authenticated Users":(CI)(OI)(M)'
