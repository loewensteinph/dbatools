﻿Set-StrictMode -Version Latest
Describe 'DBATOOLHELPER' {
	$test = Return1
	$sqlinstance = "(LocalDb)\MSSQLLocalDB"
	$amount = 3
	$dbs = @()
  # BeforeAll {
		for ($i=1; $i -lt $amount+1; $i++){
			New-DbaDatabase -SqlInstance $sqlinstance -Name unittest$i
			$db = Get-DbaDatabase -SqlInstance $sqlinstance -Database unittest$i
			$dbs += $db.Name
		}
#	}
	It 'CheckExistingDBs' {
		for ($i=1; $i -lt $amount+1; $i++){              
				$dbname = 'unittest'+$i
				$dbs[$i-1].ToString() | Should -Be $dbname
		}
	}

	It 'CheckFunc1' {
		
		$test | Should -Be 1

	}
	#AfterAll {
		for ($i=1; $i -lt $amount+1; $i++){
			Remove-DbaDatabase -SqlInstance $sqlinstance -Database unittest$i -Confirm:$false 
		}
	#}
}