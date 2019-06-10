function Get-ScriptDirectory { Split-Path -Parent $PSCommandPath }

$baseconfig = Join-Path (Get-ScriptDirectory) 'config.json'
$config = Get-Content "$baseconfig" -Raw | ConvertFrom-Json

if(Get-Member -inputobject $config -name "login" -Membertype Properties){
#Property exists
Write-Host 'login exists'
    if(Get-Member -inputobject $config.login -name "issqllogin" -Membertype Properties){
    #Property exists    
        if($config.login.issqllogin)
        {
            $pass = Read-Host "Enter Login Password" -AsSecureString
        }
    }
}
$loginargument = $config.server, $config.login.name,$pass 
New-DbaLogin @loginargument | Tee-Object c:\temp\secobj_log.txt 

foreach($cred in $config.credential) {
    $credpass = Read-Host "Enter Credential Password for Credential: '"$cred.name"'" -AsSecureString
    New-DbaCredential -SqlInstance $config.server -Name $cred.name -Identity $cred.identity -SecurePassword $credpass  | Tee-Object c:\temp\secobj_log.txt -Append
    foreach($prox in $cred.proxy) {
        $subsystems = $cred.proxy.subsystem 
        New-DbaAgentProxy -Name $prox.name -SqlInstance $config.server -ProxyCredential $cred.name -SubSystem $subsystems -Force | Tee-Object c:\temp\secobj_log.txt -Append
    }
}
