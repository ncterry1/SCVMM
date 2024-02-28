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
Get-CimClass -Namespace root/scvmm | Format-List * | Out-File -FilePath "C:\Users\ncterry\Documents\2019SCVMM_ClassDefinitions.txt"
$filepath = "C:\Users\ncterry\Documents\2019SCVMM_ClassDefinitions.txt"
$fileContents = Get-Content $filepath
$newLine = "PS> Get-CimClass -Namespace root/scvmm"
$fileContents = @($newLine) + $fileContents
$fileContents | Set-Content $filepath

# View available classes (just by name) within the root/scvmm namespace
Get-CimClass -Namespace root/scvmm | Select-Object -Property CimClassName
Get-CimClass -Namespace root/scvmm | Select-Object -Property CimClassName| Format-List * | Out-File -FilePath "C:\Users\ncterry\Documents\2019SCVMM_ClassNames.txt"
# Return all the CIM classes in the root/scvmm namespace
$filepath = "C:\Users\ncterry\Documents\2019SCVMM_ClassNames.txt"
$fileContents = Get-Content $filepath
$newLine = "PS> Get-CimClass -Namespace root/scvmm | Select-Object -Property CimClassName"
$fileContents = @($newLine) + $fileContents
$fileContents | Set-Content $filepath

# Find Common information model classes
Get-CimClass -Namespace root/scvmm -ClassName *
Get-CimClass -Namespace root/scvmm -ClassName * | Select-Object -ExpandProperty CimClassMethods | Format-List * | Out-File -FilePath "C:\Users\ncterry\Documents\2019SCVMM_CIMBaseClasses.txt"
$filepath = "C:\Users\ncterry\Documents\2019SCVMM_CIMBaseClasses.txt"
$fileContents = Get-Content $filepath
$newLine = "PS> Get-CimClass -Namespace root/scvmm -ClassName *"
$fileContents = @($newLine) + $fileContents
$fileContents | Set-Content $filepath

# Find all WMI classes related to processes that expose any methods
Get-CimClass -NameSpace root/scvmm | Where-Object {$_.CimClassMethods.Count -gt 0}
Get-CimClass -NameSpace root/scvmm | Where-Object {$_.CimClassMethods.Count -gt 0} | Format-List * | Out-File -FilePath "C:\Users\ncterry\Documents\2019SCVMM_CIMBaseClassesMethods.txt"
$filepath = "C:\Users\ncterry\Documents\2019SCVMM_CIMBaseClassesMethods.txt"
$fileContents = Get-Content $filepath
$newLine = "PS> Get-CimClass -NameSpace root/scvmm | Where-Object {$_.CimClassMethods.Count -gt 0} "
$fileContents = @($newLine) + $fileContents
$fileContents | Set-Content $filepath



# Check if a namespace exists, and return all the namespaces under the root namespace
Get-CimInstance -Namespace root -ClassName __Namespace | Select Name
Get-CimInstance -Namespace root -ClassName __Namespace | Select Name | Format-List * | Out-File -FilePath "C:\Users\ncterry\Documents\2019SCVMM_rootNamespaces.txt"
$filepath = "C:\Users\ncterry\Documents\2019SCVMM_rootNamespaces.txt"
$fileContents = Get-Content $filepath
$newLine = "PS> Get-CimInstance -Namespace root -ClassName __Namespace | Select Name "
$fileContents = @($newLine) + $fileContents
$fileContents | Set-Content $filepath


Get-CimClass -Namespace root/scvmm | ForEach-Object {
    [PSCustomObject]@{
        ClassName = $_.CimClassName
        Methods = ($_.CimClassMethods | Select-Object -ExpandProperty Name) -join ', '
    }
} | Format-List * | Out-File -FilePath "C:\Users\ncterry\Documents\2019SCVMM_classMethods.txt"
$filepath = "C:\Users\ncterry\Documents\2019SCVMM_classMethods.txt"
$fileContents = Get-Content $filepath
$newLine = "PS> Get-CimClass -Namespace root/scvmm | ForEach-Object {
    [PSCustomObject]@{
        ClassName = $_.CimClassName
        Methods = ($_.CimClassMethods | Select-Object -ExpandProperty Name) -join ', '
    }
}  "
$fileContents = @($newLine) + $fileContents
$fileContents | Set-Content $filepath