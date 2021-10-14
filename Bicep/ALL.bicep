param deploymentInfo object
param stage object
param global object

module AG 'AG.bicep' = if (stage.ag == 1) {
  name: 'dp-ag'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
    global: global
  }
}

module SA 'SA.bicep' = if (stage.sa == 1) {
  name: 'dp-sa'
  params:{
    deploymentInfo: deploymentInfo
    stage: stage
    global: global
  }
}

module VN 'VN.bicep' = if (stage.vn == 1) {
  name: 'dp-vn'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
    global: global
  }
}

module NSG 'NSG.bicep' = if (stage.nsg == 1) {
  name: 'dp-nsg'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
    global: global
  }
}

module AZSQL 'AZSQL.bicep' = if (stage.azsql == 1) {
  name: 'dp-azsql'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
    global: global
  }
}

module ASP 'ASP.bicep' = if (stage.asp == 1) {
  name: 'dp-asp'
  params: {
    deploymentInfo: deploymentInfo
    stage: stage
    global: global
  }
}
