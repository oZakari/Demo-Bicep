param deploymentInfo object
param stage object

var actionGroupInfo = deploymentInfo.actionGroupInfo

module AG 'AG-ActionGroup.bicep' = [for (ag, index) in actionGroupInfo: {
  name: 'dp-actionGroupDeploy-${(length(actionGroupInfo))}'
  params: {
    actionGroupInfo: ag
  }
}]
