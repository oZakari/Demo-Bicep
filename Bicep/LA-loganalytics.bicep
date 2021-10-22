param logAnalyticsWorkspaceInfo object
param global object

var deployment = '${global.appName}-${global.environment}'

resource workspaces_defaultworkspace_38fef25a_a926_4719_8c80_de78ac6df0f7_wus2_name_resource 'microsoft.operationalinsights/workspaces@2021-06-01' = {
  name: toLower('${deployment}-${logAnalyticsWorkspaceInfo.name}')
  location: 'West US 2'
  properties: {
    provisioningState: 'Succeeded'
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}
