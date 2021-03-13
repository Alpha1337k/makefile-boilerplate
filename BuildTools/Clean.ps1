[CmdletBinding()]
param(
	[Parameter(mandatory=$true)]$ExtensionName,
	[Parameter(mandatory=$true)]$Publisher,
	[Parameter(mandatory=$true)]$version
)

Remove-Item $env:USERPROFILE/.vscode/extensions/$Publisher.$Name-$version -Recurse -Force -ErrorAction Ignore 