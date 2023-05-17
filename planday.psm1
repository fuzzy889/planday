$global:uri=@{
    "token"="https://id.planday.com/connect/token"
    "employees"="https://openapi.planday.com/hr/v1"
    "punchclock"="https://openapi.planday.com/punchclock/v1"
    "absence"="https://openapi.planday.com/absence/v1"
};

$tokenBody=@{
    "client_id"="a75a977c-e154-44c2-a995-ae1fad3a0596"
    "refresh_token"="x1NGsvcF8EGpMETqCkKEAQ"
    "grant_type"="refresh_token"
};

Function Get-PlandayToken {
    $script:access_token=(Invoke-RestMethod -Method POST -ContentType "application/x-www-form-urlencoded" -Uri $uri.token -Body $tokenBody).access_token;
    $script:requestHeaders = @{
        "Authorization"="Bearer $access_token"
        "X-ClientId"="a75a977c-e154-44c2-a995-ae1fad3a0596"
    };
};