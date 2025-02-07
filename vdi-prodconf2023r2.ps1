<#
Script for running ProductConfig.exe on the VDI hosts during build
ANSYS 2022R2, 2023R1, and 2023R2
Love Håkansson 2023-09-13, 2023-10-10
#>

# Adding the DNS suffix to get the ANSYS path correct
Set-DnsClientGlobalSetting -SuffixSearchList 'internal.edrm'

# Fetching the password for the 'imageInstall' account on \\spark and connecting to the share
Connect-AzAccount -Identity
$username = 'spark.internal.edrm\imageinstall'
$password = (Get-AzKeyVaultSecret -VaultName kvedrm -Name imageBuilderPassWordSpark -AsPlainText) | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -Typename System.Management.Automation.PSCredential -ArgumentList $username, $password
New-PSDrive -Name "Z" -PSProvider "FileSystem" -Root "\\spark\ansys inc" -Credential $credential

# Building the command line for Ansys ProductConfig
$argList = @('-silent', '-config', '-soundsas', '-discovery', '-spaceclaim', '-icepak', '-cfx', '-chemkinpro', '-ensight', '-fensapice', '-fluent', '-forte',
'-icemcfd', '-mfl', '-polyflow', '-reactionwb', '-turbogrid', '-speos', '-speoshpc', '-optislang', '-additive', '-aqwa', '-autodyn', '-ansyscust',
'-lsdyna', '-mechapdl', '-motion', '-sherlock', '-scdm_config')

# Installing prerequisites, .NET, and configuring products
$env:SEE_MASK_NOZONECHECKS = 1
Start-Process -FilePath "\\spark\ansys inc\v232\ProductConfig.exe" -ArgumentList @('-silent', '-prereqs') -Wait
Start-Process -FilePath "\\spark\ansys inc\v232\ProductConfig.exe" -ArgumentList @('-silent', '-caspol') -Wait
Start-Process -FilePath "\\spark\ansys inc\v222\ProductConfig.exe" -ArgumentList $argList -Wait
Start-Process -FilePath "\\spark\ansys inc\v231\ProductConfig.exe" -ArgumentList $argList -Wait
Start-Process -FilePath "\\spark\ansys inc\v232\ProductConfig.exe" -ArgumentList $argList -Wait

# Installing the HPC Pack Client utilities
Start-Process -FilePath "\\spark\reminst\setup.exe" -ArgumentList @('/Unattend', '/Client') -Wait

# Resetting the DNS suffix
Set-DnsClientGlobalSetting -SuffixSearchList ''
