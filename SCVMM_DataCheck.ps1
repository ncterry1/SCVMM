<#
SCVMM Versions
* System Center Virtual Machine Manager
-------------
>  SCVMM 2022 
>>>RELEASE DATE: NOVEMBER 2023
- Installed 2/14/24 - 13:35
The initial install file only sets up the basics.
You still need to go into: C:\System Center Virtual Machine Manager
Then run 'Setup'
Once installed, the setup can be found here: C:\System Center Virtual Machine Manager

To Uninstall: 
Control panel--> Programs--> Programs and Features
Select Virtual Machine Manager and click Uninstall
In the uninstall wizard, select Remove Features
Then select both VMM management Server and VMM Console under the features remove list
On the database options page, select Retain Database IF you want to keep the database for future use.
Review the summary and select uninstall.
-------------
>  SCVMM 2019
>>>RELEASE DATE: APRIL 2023
------------- 
>  SCVMM 2016
>>>RELEASE DATE: OCTOBER 2020
-------------
>  SCVMM 1807(1801)
>>>RELEASE DATE: 
#>

# Get all the class definitions under a specific namespace
Get-CimClass -Namespace root/scvmm
Get-CimClass -Namespace root/scvmm | Format-List * | Out-File -FilePath "C:\Users\nct\Documents\2022_ClassDefinitions.txt"
# Return all the CIM classes in the root/scvmm namespace

# Find all WMI classes related to processes that expose any methods
Get-CimClass -ClassName *process* -MethodName * 
Get-CimClass -ClassName *process* -MethodName * | Format-List * | Out-File -FilePath "C:\Users\nct\Documents\2022_WMIClasses.txt"

# Find public methods
Get-CimClass -Namespace root/scvmm -ClassName *
Get-CimClass -Namespace root/scvmm -ClassName * | Select-Object -ExpandProperty CimClassMethods | Format-List * | Out-File -FilePath "C:\Users\nct\Documents\2022_PublicMethods.txt"


# Check if a namespace exists, and return all the namespaces under the root namespace
Get-WmiObject -Namespace root -Class __Namespace | Select Name
Get-WmiObject -Namespace root -Class __Namespace | Select Name | Format-List * | Out-File -FilePath "C:\Users\nct\Documents\2022_rootNamespaces.txt"

