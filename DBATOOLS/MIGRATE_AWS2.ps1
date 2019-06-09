# Mehrere Zielserver Komma getrennt auflisten
# -WhatIf zeigt Vorschau der Aktion -> keine Durchführung
# Start-DbaMigration -> Migriert alles gem. Parametern -> Hier Einzelschritte

$Quellserver = 'WKLOEWENSTPH01\SQL2016'
$Zielserver = 'WKLOEWENSTPH01\SQL2019'

# Credentials übertragen
Copy-DbaCredential -Source $Quellserver -Destination $Zielserver -Name 'CRED_HTT1234' | Tee-Object c:\temp\aws2_log.txt #| Out-File -FilePath C:\Temp\Process.txt -Append
# Logins übertragen
Copy-DbaLogin -Source $Quellserver -Destination $Zielserver -Login Login2 | Tee-Object c:\temp\aws2_log.txt -Append #-force
# Ziel Server Version > Akt Server Compa anpassen
Set-DbaDbCompatibility -SqlInstance $Quellserver -TargetCompatibility 13 -Database AWS2 | Tee-Object c:\temp\aws2_log.txt -Append #-force
# DB übertragen 
Copy-DbaDatabase -Source $Quellserver -Destination $Zielserver -Database AWS2 -DetachAttach -Reattach | Tee-Object c:\temp\aws2_log.txt -Append # -BackupRestore # -SharedPath \\Wkloewenstph01\transf