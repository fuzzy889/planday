@{
RootModule = 'planday.psm1'
ModuleVersion = '0.0.2'
Author = 'Adam Sahlqvist'
CompanyName = 'Power International Logistics AB'
NestedModules = @(
	'employees.ps1'
    'punchclock.ps1'
    'absenceAccounts.ps1'
)
FunctionsToExport='Get-PlandayToken', 'Get-PlandayEmployees', 'Get-PlandayPunchclock', 'Get-PlandayAbsenceAccounts'
}