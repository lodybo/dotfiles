If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    Break
}

$remoteport = bash.exe -c "ip addr | grep -E 'inet.*eth0'"
$found = $remoteport -match '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}';

if ($found) {
    $remoteport = $matches[0];
}
else {
    Write-Output "IP address could not be found";
    exit;
}

$ports = @(22, 80, 443, 3000, 4000, 4100, 4200, 5000, 8000, 8080, 8081, 8888, 9080);

for ($i = 0; $i -lt $ports.length; $i++) {
    $port = $ports[$i];

    Write-Output "Bridging port $port";
    Invoke-Expression "netsh interface portproxy delete v4tov4 listenport=$port";
    Invoke-Expression "netsh advfirewall firewall delete rule name=$port";

    Invoke-Expression "netsh interface portproxy add v4tov4 listenport=$port connectport=$port connectaddress=$remoteport";
    Invoke-Expression "netsh advfirewall firewall add rule name=$port dir=in action=allow protocol=TCP localport=$port";
}

Invoke-Expression "netsh interface portproxy show v4tov4";
