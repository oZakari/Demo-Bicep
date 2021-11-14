param azSqlInfo object
param global object

var deployment = '${global.appName}-${global.environment}'
var allowedips = contains(azSqlInfo, 'allowedips') ? azSqlInfo.allowedips : []

resource AZSQL 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: toLower('${deployment}-${azSqlInfo.name}')
  location: resourceGroup().location
  properties: {
    administratorLogin: azSqlInfo.adminLogin
    administratorLoginPassword: azSqlInfo.adminPw
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }  
}

resource AZSQL_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: AZSQL
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource AZSQL_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: AZSQL
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource AZSQL_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: AZSQL
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource AZSQL_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: AZSQL
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource AZSQL_DefaultSettings 'Microsoft.Sql/servers/auditingSettings@2021-02-01-preview' = {
  parent: AZSQL
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    storageAccountSubscriptionId: subscription().id
  }
}

module AZSQL_FirewallRules 'x.FWR.bicep' = [for (allowedip, index) in allowedips: {
  name: 'dp-allowedipsdeploy-${azSqlInfo.name}-${allowedip.name}'
  params: {
    AZSQLName: AZSQL.name
    allowedip: allowedip
  }
}]

