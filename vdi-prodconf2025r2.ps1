<#
Script for running ProductConfig.exe on the VDI hosts during build
ANSYS 2024R1, 2024R2, 2025R1 and 2025R2
Love Håkansson 2023-09-13, 2023-10-10, 2024-01-20, 2024-09-10, 2025-01-21, 2025-08-06
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
$argList = @('-silent', '-config', '-discovery', '-spaceclaim', '-icepak', '-cfx', '-chemkin', '-ensight', '-fensapice', '-fluent', '-forte',
'-icemcfd', '-mfl', '-polyflow', '-reactionwb', '-turbogrid', '-speos', '-speoshpc', '-optislang', '-additive', '-aqwa', '-autodyn', '-ansyscust',
'-lsdyna', '-mechapdl', '-motion', '-sherlock', '-scdm_config', '-selector', '-blademodeler', '-electromagneticssuite', '-lumerical', '-rocky', '-thermaldesktop', '-zemaxos')

# Installing prerequisites, .NET, and configuring products
$env:SEE_MASK_NOZONECHECKS = 1
Start-Process -FilePath "\\spark\ansys inc\v252\ProductConfig.exe" -ArgumentList @('-silent', '-prereqs') -Wait
Start-Process -FilePath "\\spark\ansys inc\v251\ProductConfig.exe" -ArgumentList @('-silent', '-config') -Wait
Start-Process -FilePath "\\spark\ansys inc\v252\ProductConfig.exe" -ArgumentList @('-silent', '-config') -Wait

# Installing the HPC Pack Client utilities
Start-Process -FilePath "\\spark\reminst\setup.exe" -ArgumentList @('/Unattend', '/Client') -Wait

# Resetting the DNS suffix
Set-DnsClientGlobalSetting -SuffixSearchList ''
