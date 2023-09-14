<#
Script for running ProductConfig.exe on the VDI hosts during build
Love Håkansson 2023-09-13
#>

# Fetching the password for the 'imageInstall' account on \\spark and connecting to the share
Connect-AzAccount -Identity
$username = 'spark.internal.edrm\imageinstall'
$password = (Get-AzKeyVaultSecret -VaultName kvedrm -Name imageBuilderPassWordSpark -AsPlainText) | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -Typename System.Management.Automation.PSCredential -ArgumentList $username, $password
New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\spark.internal.edrm\ansys inc" -Credential $credential

# Building the command line for Ansys ProductConfig
$argList = @('-silent', '-config', '-soundsas', '-discovery', '-spaceclaim', '-icepak', '-cfx', '-chemkinpro', '-ensight', '-fensapice', '-fluent', '-forte',
'-icemcfd', '-mfl', '-polyflow', '-reactionwb', '-turbogrid', '-speos', '-speoshpc', '-optislang', '-additive', '-aqwa', '-autodyn', '-ansyscust',
'-lsdyna', '-mechapdl', '-motion', '-sherlock')

# Installing prerequisites, .NET, and configuring products
$env:SEE_MASK_NOZONECHECKS = 1
Start-Process -FilePath "\\spark.internal.edrm\ansys inc\v232\ProductConfig.exe" -ArgumentList @('-silent', '-prereqs') -Wait
Start-Process -FilePath "\\spark.internal.edrm\ansys inc\v232\ProductConfig.exe" -ArgumentList @('-silent', '-caspol') -Wait
Start-Process -FilePath "\\spark.internal.edrm\ansys inc\v232\ProductConfig.exe" -ArgumentList $argList -Wait
