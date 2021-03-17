[CmdletBinding()]
param(
	[Parameter(mandatory = $true)][string]$ExtensionName,
	[Parameter(mandatory = $true)][string]$Publisher,
	[Parameter(mandatory = $true)][string]$version
)

. $PSScriptRoot\BuildFunctions.ps1

Set-Location $(Split-Path $PSScriptRoot -Parent)
$config = Get-Content package.json | ConvertFrom-Json -Depth 4
$config.version = $version.ToString()
$config.name = $ExtensionName
$config.publisher = $publisher

Foreach ($file in $(Get-MyExtensionFiles | where { $_.Extension -eq '.code-snippets' })) {
	$relPath = (Resolve-Path -Path $file.FullName -Relative) -replace "\\", "/"
	$newSnippet = New-Object PSCustomObject -Property @{
		language = "makefile"
		path     = $relPath
	}

	if ($relPath -notin ($config.contributes.snippets | select -expandproperty path)) {
		$config.contributes.snippets += $newSnippet
	}

}

$config | ConvertTo-Json -depth 4 | Set-Content package.json

