# Mehrere Zielserver Komma getrennt auflisten
# -WhatIf zeigt Vorschau der Aktion -> keine Durchführung
# Start-DbaMigration -> Migriert alles gem. Parametern -> Hier Einzelschritte

$Zielserver1 = 'WKLOEWENSTPH01\SQL2016'

Uninstall-DbaSqlWatch -SqlInstance $Zielserver1 -Database SQLWATCH
Install-DbaSqlWatch -SqlInstance $Zielserver1 -Database SQLWATCH

Install-DbaFirstResponderKit -SqlInstance $Zielserver1 -Database DBA
