param azureFunctionInfo object
param global object

var deployment = '${global.appName}-${global.environment}'

resource ASP 'Microsoft.Web/serverfarms@2021-02-01' existing = {
  name: azureFunctionInfo.asp
}

resource AF 'Microsoft.Web/sites@2021-02-01' = {
  name: toLower('${deployment}-${azureFunctionInfo.name}')
  location: resourceGroup().location
  kind: 'functionapp'
  properties: {
    enabled: true
    serverFarmId: ASP.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}
