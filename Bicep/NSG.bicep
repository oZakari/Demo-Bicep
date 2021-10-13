param deploymentInfo object
param stage object
param global object

var nsgInfo = deploymentInfo.vnInfo

module NSG 'NSG-NSG.bicep' = [for (nsg, index) in nsgInfo: {
  name: 'dp-nsgdeploy-${nsg.name}))}'
  params: {
    networkSecurityGroupInfo: nsg
    global: global
  }
}]


