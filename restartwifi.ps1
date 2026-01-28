if (!(([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
	Start-Process powershell -Verb RunAs $PSCommandPath
	exit
}

$wifi = "PCI\VEN_14C3&DEV_7925&SUBSYS_60011A3B&REV_00\4&23908FFE&0&0013"

Write-Host "Disabling..."
Disable-PnpDevice $wifi -Confirm:$false
Write-Host "Enabling..."
Enable-PnpDevice $wifi -Confirm:$false