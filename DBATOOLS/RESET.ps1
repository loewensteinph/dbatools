# Mehrere Zielserver Komma getrennt auflisten
# -WhatIf zeigt Vorschau der Aktion -> keine Durchführung
# Start-DbaMigration -> Migriert alles gem. Parametern -> Hier Einzelschritte

$Zielserver1 = 'WKLOEWENSTPH01\SQL2017'
$Zielserver2 = 'WKLOEWENSTPH01\SQL2019'

Remove-DbaDatabase -SqlInstance $Zielserver1 -Database AWS1 | Tee-Object c:\temp\reset_log.txt 
Remove-DbaDatabase -SqlInstance $Zielserver2 -Database AWS2 | Tee-Object c:\temp\reset_log.txt -Append

Remove-DbaLogin -SqlInstance $Zielserver1 -Login Login1 | Tee-Object c:\temp\reset_log.txt -Append
Remove-DbaLogin -SqlInstance $Zielserver2 -Login Login2 | Tee-Object c:\temp\reset_log.txt -Append

Remove-DbaAgentJob -SqlInstance $Zielserver1 -Job AWS1Job | Tee-Object c:\temp\reset_log.txt -Append
Remove-DbaAgentJobCategory -SqlInstance $Zielserver1 -Category 'AWS1' | Tee-Object c:\temp\reset_log.txt -Append

