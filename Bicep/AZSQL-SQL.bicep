param azSqlInfo object
param global object

var deployment = '${global.appName}-${global.environment}'

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
