<#
Script to download and extract the Rescale CLI
Love Håkansson 2024-05-17, 2024-09-10, 2025-01-03, 2025-08-07
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/rescale-cli_windows-x64_1_1_301-e3565ccf1e.zip -OutFile c:\edrm\rescale.zip
Expand-Archive -Path c:\edrm\rescale.zip -DestinationPath 'C:\Program Files\RescaleCLI' -Force
