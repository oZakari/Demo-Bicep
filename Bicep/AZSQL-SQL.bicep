param azSqlInfo object

resource AZSQL 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: toLower('${azSqlInfo.namePrefix}sa${azSqlInfo.nameSuffix}')
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
