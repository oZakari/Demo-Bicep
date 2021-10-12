param storageInfo object

resource SA 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: toLower('${storageInfo.namePrefix}sa${storageInfo.nameSuffix}')
  location: resourceGroup().location
  sku: {
    name: storageInfo.skuName
  }
  kind: 'StorageV2'
  properties: {
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: storageInfo.publicAccess
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource SABlobService 'Microsoft.Storage/storageAccounts/blobServices@2021-02-01' = {
  name: '${toLower('${storageInfo.namePrefix}sa${storageInfo.nameSuffix}')}/default'
  properties: {
    isVersioningEnabled: (contains(storageInfo, 'blobVersioning') ? storageInfo.blobVersioning : bool('false'))
    changeFeed: {
      enabled: (contains(storageInfo, 'changeFeed') ? storageInfo.changeFeed : bool('false'))
    }
    deleteRetentionPolicy: (contains(storageInfo, 'softDeletePolicy') ? storageInfo.softDeletePolicy : json('null'))
  }
  dependsOn: [
    SA
  ]
}

resource SAFileService 'Microsoft.Storage/storageAccounts/fileServices@2021-04-01' existing = {
  name: 'default'
  parent: SA
}

resource SAQueueService 'Microsoft.Storage/storageAccounts/queueServices@2021-04-01' existing = {
  name: 'default'
  parent: SA
}

resource SATableService 'Microsoft.Storage/storageAccounts/tableServices@2021-04-01' existing = {
  name: 'default'
  parent: SA
}
