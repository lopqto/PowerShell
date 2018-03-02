$InputFileName = Read-Host -Prompt "Please Enter File Name "

foreach ($Domain in Get-Content "$InputFileName") {
    $IP = $(Resolve-DnsName "$Domain").IPAddress | Select-Object -First 1
    $Result = ""
    If ( "$IP" -eq "10.10.34.34" ) {
        $Result = "$Domain : Blocked"
    }
    Else {
        $Result = "$Domain : Free"
    }
    Out-File -Append IsItFilterResult.txt -InputObject $Result
}