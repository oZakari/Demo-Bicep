param deploymentInfo object
param stage object

var virtualNetworkInfo = deploymentInfo.virtualNetworkInfo

module VN 'VN-virtualnetwork.bicep' = [for (vn, index) in virtualNetworkInfo: {
  name: 'dp-vnetdeploy-${(length(virtualNetworkInfo))}'
  params: {
    virtualNetworkInfo: vn
  }
}]
