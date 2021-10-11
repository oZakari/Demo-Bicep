$rgname = 'SierraWireless-PoC'
$region = 'West US 2'
Write-Warning -Message "RG is: [$rgname] in Region: [$region]"

$MyParametersDeployALL = @{
    ResourceGroupName     = $rgname
    TemplateParameterFile = "C:\Repos\SierraWireless\Bicep\0-param-dev-env.json"
    Verbose               = $true
    WhatIf                = $false
}

break

New-AzResourceGroup -Name $rgname -Location $region -Force

# Orchestrate the deployment of all resources
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\ALL.bicep

# Deploy Single layer, inner dev loop - Storage only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\SA.bicep

# Deploy Single layer, inner dev loop - VNET and subnets only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\VN.bicep