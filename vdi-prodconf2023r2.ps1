<#
Script for running ProductConfig.exe on the VDI hosts during build
Love Håkansson 2023-09-13
#>

# Fetching the password file for the 'imageInstall' account on \\spark
Connect-AzAccount -Identity
$username = 'spark.internal.edrm\imageinstall'
$password = (Get-AzKeyVaultSecret -VaultName kvedrm -Name imageBuilderPassWordSpark -AsPlainText) | ConvertTo-SecureString -AsPlainText -Force
# $spassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password

$argList = @('-silent', '-config', '-soundsas', '-discovery', '-spaceclaim', '-icepak', '-cfx', '-chemkinpro', '-ensight', '-fensapice', '-fluent', '-forte',
'-icemcfd', '-mfl', '-polyflow', '-reactionwb', '-turbogrid', '-speos', '-speoshpc', '-optislang', '-additive', '-aqwa', '-autodyn', '-ansyscust',
'-lsdyna', '-mechapdl', '-motion', '-sherlock')
New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\spark.internal.edrm\ansys inc" -Credential $credential
Start-Process -FilePath "\\spark.internal.edrm\ansys inc\v232\ProductConfig.exe" -ArgumentList @('-silent', '-prereqs') -Wait
Start-Process -FilePath "\\spark.internal.edrm\ansys inc\v232\ProductConfig.exe" -ArgumentList @('-silent', '-caspol') -Wait
Start-Process -FilePath "\\spark.internal.edrm\ansys inc\v232\ProductConfig.exe" -ArgumentList $argList -Wait
