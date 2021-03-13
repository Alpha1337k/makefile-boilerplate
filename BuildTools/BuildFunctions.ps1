function Get-MyExtensionFiles {
	Write-Output (Get-ChildItem -Recurse -File | where { (Split-Path (Split-Path $_.FullName -Parent) -leaf) -notin (".vscode", "build") -and $_.Name -notin @(".git", ".vscodeignore", ".gitattributes", ".gitignore", 'Makefile') })
} 