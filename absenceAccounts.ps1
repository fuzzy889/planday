Function Get-PlandayAbsenceAccounts {

    Get-PlandayToken;

	$thisYear = [int](Get-Date -Format "yyyy");
	$nextYear = $thisYear+1;
	$date = (Get-Date -Format "yyyy-MM-dd");
    $absenceAccounts_temp = (Invoke-RestMethod -Method GET -Uri "$($uri.absence)/accounts?status=Active&accountTypeId=11284&accountTypeId=11352&startDate=$($thisYear)-04-01&endDate=$($nextYear)-03-31" -Headers $requestHeaders).data;
	$global:absenceAccounts=@();
    $temp=@();
	
	$absenceAccounts_temp | ForEach-Object {
		
		 $temp=(Invoke-RestMethod -Method GET -Uri "$($uri.absence)/accounts/$($_.id)/balance" -Headers $requestHeaders).data;
		 Write-Output $temp;
		 $global:absenceAccounts+=[PSCustomObject]@{
			 "accountId"=$temp.accountId
			 "employeeId"=$_.employeeId
			 "days"=$temp.balance[0].value
		 };
	};	
};