Function Get-PlandayToken {

$tokenBody=@{
    "client_id"="a75a977c-e154-44c2-a995-ae1fad3a0596"
    "grant_type"="refresh_token"
    "refresh_token"="x1NGsvcF8EGpMETqCkKEAQ"
};

$access_token=(Invoke-RestMethod -Method POST -ContentType "application/x-www-form-urlencoded" -Uri "https://id.planday.com/connect/token" -Body $tokenBody).access_token;

Write-Output $access_token;

};