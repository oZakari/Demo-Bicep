param applicationInsightsInfo object
param global object

var deployment = '${global.appName}-${global.environment}'

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: toLower('${deployment}-${applicationInsightsInfo.name}')
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: 
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}
