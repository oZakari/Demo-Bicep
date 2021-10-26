$rgname = 'SierraWireless-PoC-Dev'
$region = 'West US 2'
Write-Warning -Message "RG is: [$rgname] in Region: [$region]"

$MyParametersDeployALL = @{
    ResourceGroupName     = $rgname
    TemplateParameterFile = ".\Bicep\0-param-dev-env.json"
    Verbose               = $true
    WhatIf                = $false
}

break

New-AzResourceGroup -Name $rgname -Location $region -Force

# Orchestrate the deployment of all resources
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\ALL.bicep

# Deploy Single layer, inner dev loop - Action Group only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\AG.bicep

# Deploy Single layer, inner dev loop - Storage only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\SA.bicep

# Deploy Single layer, inner dev loop - VNET and subnets only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\VN.bicep

# Deploy Single layer, inner dev loop - NSG only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\NSG.bicep

# Deploy Single layer, inner dev loop - SQL Server only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\AZSQL.bicep

# Deploy Single layer, inner dev loop - App Service Plan only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\ASP.bicep

# Deploy Single layer, inner dev loop - Log Analytics only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\LA.bicep

# Deploy Single layer, inner dev loop - App Insights only
New-AzResourceGroupDeployment @MyParametersDeployALL -TemplateFile .\bicep\AI.bicep

