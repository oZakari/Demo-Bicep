param virtualNetworkInfo object

resource VN 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: '${virtualNetworkInfo.namePrefix}-vnet-${virtualNetworkInfo.nameSuffix}'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'virtualNetworkInfo.subnetOne'
        properties: {
          addressPrefix: '10.10.1.0/24'
        }
      }
      {
        name: 'virtualNetworkInfo.subnetTwo'
        properties: {
          addressPrefix: '10.10.2.0/24'
        }
      }
    ]
  }
}
