$modulename = 'DBATOOLHELPER'
$currentDir = Get-Location
# Install-Module -Name Pester -Force -SkipPublisherCheck
Remove-Module DBATOOLHELPER -ErrorAction SilentlyContinue -WarningAction SilentlyContinue

$docs = [Environment]::GetFolderPath("MyDocuments")
New-Item -ItemType Directory -Force -Path $docs'\WindowsPowerShell\Modules\'$modulename | Out-Null
Copy-Item -Path $currentDir'\'$modulename'.psd1' -Destination $docs'\WindowsPowerShell\Modules\'$modulename  -Force | Out-Null
Copy-Item -Path $currentDir'\'$modulename'.psm1' -Destination $docs'\WindowsPowerShell\Modules\'$modulename  -Force | Out-Null

Import-Module DBATOOLHELPER -Scope Local