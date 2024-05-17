<#
Script to copy the Microsoft Defender for Endpoint onboarding scripts
Love Håkansson 2024-05-17
#>

Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/DefenderOnboardingScripts/Onboard-NonPersistentMachine.ps1 -OutFile c:\temp\Onboard-NonPersistentMachine.ps1
Invoke-WebRequest -Uri https://strgedrm.blob.core.windows.net/software/DefenderOnboardingScripts/WindowsDefenderATPOnboardingScript.cmd -OutFile c:\temp\WindowsDefenderATPOnboardingScript.cmd
