param deploymentInfo object
param stage object

var storageInfo = deploymentInfo.storageInfo

module SA 'SA-Storage.bicep' = [for (sa, index) in storageInfo: {
  name: 'dp-storageDeploy-${(length(storageInfo))}'
  params: {
    storageInfo: sa
  }
}]
