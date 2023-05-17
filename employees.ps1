Function Get-PlandayEmployees {

    Get-PlandayToken;

    $all=(Invoke-RestMethod -Method GET -Uri "$($uri.employees)/employees" -Headers $requestHeaders);
    $employees_temp=$all.data;
    $runs=[Math]::Floor($all.paging.total/50);
    $offset=50;

    For ($i=0; $i -lt $runs) {
        $employees_temp+=(Invoke-RestMethod -Method GET -Uri "$($uri.employees)/employees?Offset=$($offset)" -Headers $requestHeaders).data
        $offset=$offset+50;
        $i++;
    };

    $global:employees=@();
    $temp=@();

    $employees_temp | ForEach-Object {
        $temp=(Invoke-RestMethod -Method GET -Uri "$($uri.employees)/employees/$($_.id)?special=BirthDate" -Headers $requestHeaders).data;
		Write-Output $temp;
        $global:employees+=[PSCustomObject]@{
            "id"=$temp.id
            "hiredFrom"=$temp.hiredFrom
            "salaryIdentifier"=$temp.salaryIdentifier
            "gender"=$temp.gender
            "employeeTypeId"=$temp.employeeTypeId
            "dateTimeCreated"=$temp.dateTimeCreated
            "dateTimeModified"=$temp.dateTimeModified
            "firstName"=$temp.firstName
            "lastName"=$temp.lastName
            "userName"=$temp.userName
            "cellPhone"=$temp.cellPhone
            "birthDate"=$temp.birthDate
            "cellPhoneCountryCode"=$temp.cellPhoneCountryCode
            "street1"=$temp.street1
            "street2"=$temp.street2
            "zip"=$temp.zip
            "city"=$temp.city
            "email"=$temp.email
#            "departments"=$temp.departments
#            "employeeGroups"=$temp.employeeGroups
            "systemId"=$temp.custom_212319.value
            "cardNumber"=$temp.custom_212342.value
            "employmentForm"=$temp.custom_213332.value
            "department"=$temp.custom_213334.value
            "agreementArea"=$temp.custom_213333.value
        };
    };
};
