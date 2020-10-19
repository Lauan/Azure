Install-Windowsfeature web-server -IncludeManagementTools
sleep 11
$site = Invoke-webrequest -Uri "https://raw.githubusercontent.com/Lauan/www/master/index.html" -UseBasicParsing
$html = $site.content.replace("hostname: ","hostname: $env:computername")
Set-content -Path C:\inetpub\wwwroot\index.html -value $html
