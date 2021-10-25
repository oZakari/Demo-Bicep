param applicationInsightsInfo object
param global object

var deployment = '${global.appName}-${global.environment}'

resource LA 'microsoft.operationalinsights/workspaces@2021-06-01' existing = {
  name: applicationInsightsInfo.la
}

resource AI 'Microsoft.Insights/components@2020-02-02' = {
  name: toLower('${deployment}-${applicationInsightsInfo.name}')
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: LA.id
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}
