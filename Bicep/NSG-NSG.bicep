param networkSecurityGroupInfo object
param global object

var deployment = '${global.appName}-${global.environment}'

resource networkSecurityGroup'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
  name: toLower('${deployment}-${networkSecurityGroupInfo.name}')
  location: resourceGroup().location
  properties: {
    securityRules: []
  }
}
