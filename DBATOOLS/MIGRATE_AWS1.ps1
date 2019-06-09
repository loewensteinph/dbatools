# Mehrere Zielserver Komma getrennt auflisten
# -WhatIf zeigt Vorschau der Aktion -> keine Durchführung
# Start-DbaMigration -> Migriert alles gem. Parametern -> Hier Einzelschritte

$Quellserver = 'WKLOEWENSTPH01\SQL2016'
$Zielserver = 'WKLOEWENSTPH01\SQL2017'

# Logins übertragen
Copy-DbaLogin -Source $Quellserver -Destination $Zielserver -Login Login1 | Tee-Object c:\temp\aws1_log.txt 
# DB übertragen 
Copy-DbaDatabase -Source $Quellserver -Destination $Zielserver -Database AWS1 -DetachAttach -Reattach | Tee-Object c:\temp\aws1_log.txt -Append # -BackupRestore # -SharedPath \\Wkloewenstph01\transf

# Agent Job Kategorie übertragen
Copy-DbaAgentJobCategory -Source $Quellserver -Destination $Zielserver -JobCategory 'AWS1' | Tee-Object c:\temp\aws1_log.txt -Append
# Agent Job übertragen
Copy-DbaAgentJob -Source $Quellserver -Destination $Zielserver -Job AWS1Job | Tee-Object c:\temp\aws1_log.txt -Append
# Zielserver 2019 -> evtl. Compa hochsetzen! 
Set-DbaDbCompatibility -SqlInstance $Zielserver -Database AWS1 -TargetCompatibility 14 | Tee-Object c:\temp\aws1_log.txt -Append
