Function Get-PlandayPunchclock {

    Get-PlandayToken;

    $yesterday=(Get-Date).AddDays(-1);
    $from=(Get-Date -Date $yesterday -Format "yyyy-MM-ddT00:00:00");
    $to=(Get-Date -Date $yesterday -Format "yyyy-MM-ddT23:59:59");

    $global:punchclock=(Invoke-RestMethod -Method GET -Uri "$($uri.punchclock)/punchclockshifts?From=$($from)&To=$($to)" -Headers $requestHeaders).data;
    $noOfRows=($global:punchclock | measure).Count
    $offset=50;

    Do {
        $global:punchclock+=(Invoke-RestMethod -Method GET -Uri "$($uri.punchclock)/punchclockshifts?From=$($from)&To=$($to)&Offset=$($offset)" -Headers $requestHeaders).data;
        $offset=$offset+50;
        $noOfRows=($global:punchclock | measure).Count;
    }
    While ($noOfRows % 50 -eq 0);
#    $global:punchclock | Export-Csv -Path "C:\Test\punchclock.csv" -Delimiter ";" -UseQuotes AsNeeded
};
