#requires -version 5
<#
  JobFlow setup (Windows) — copies this starter kit into a fresh working folder.

  Usage:
    .\setup.ps1                 # creates .\JobFlow
    .\setup.ps1 C:\Path\JobFlow # creates it at the path you give

  Run this from inside the unzipped JobFlow starter kit. It will not overwrite an
  existing folder, so your data is safe.
#>
param([string]$Path = "JobFlow")

$ErrorActionPreference = "Stop"
$kit = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Test-Path (Join-Path $kit "Prompts"))) {
  Write-Error "Run this from inside the unzipped JobFlow starter kit (no Prompts\ found next to the script)."
  exit 1
}

$target = if ([System.IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path (Get-Location) $Path }
if (Test-Path $target) {
  Write-Error "'$target' already exists. Choose a new path so existing data isn't touched."
  exit 1
}

New-Item -ItemType Directory -Path $target -Force | Out-Null

$skip = @('setup.ps1', 'setup.sh')
Get-ChildItem -Path $kit -Force | Where-Object { $skip -notcontains $_.Name } | ForEach-Object {
  Copy-Item -Path $_.FullName -Destination $target -Recurse -Force
}

Write-Host ""
Write-Host "JobFlow is ready at: $target"
Write-Host "Next:"
Write-Host "  1. Open $target\START-HERE.md"
Write-Host "  2. Drop your resumes / writing samples / project docs into $target\Seed\"
Write-Host "  3. Paste $target\Prompts\orchestrator.md into your AI assistant"
