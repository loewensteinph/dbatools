$modulename = 'DBATOOLHELPER'
$currentDir = Get-Location

$docs = [Environment]::GetFolderPath("MyDocuments")
New-Item -ItemType Directory -Force -Path $docs'\WindowsPowerShell\Modules\'$modulename | Out-Null
Copy-Item -Path $currentDir'\'$modulename'.psd1' -Destination $docs'\WindowsPowerShell\Modules\'$modulename  -Force | Out-Null
Copy-Item -Path $currentDir'\'$modulename'.psm1' -Destination $docs'\WindowsPowerShell\Modules\'$modulename  -Force | Out-Null

#Install-Module $modulename -Scope CurrentUser