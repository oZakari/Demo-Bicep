param actionGroups_SWIDBA_name string = 'SWIDBA'
param actionGroups_function_app_name string = 'function-app'
param servers_mfgt_sql_server_dev001_name string = 'mfgt-sql-server-dev002'
param metricAlerts_Connection_failure_name string = 'Connection failure'
param serverfarms_ASP_mfgtdatatransfer_b74c_name string = 'ASP-mfgtdatatransfer-b74c'
param sites_mfgt_func_app_unzip_blob_dev001_name string = 'mfgt-func-app-unzip-blob-dev001'
param storageAccounts_sqlvaszrcuj3qy5jh2_name string = 'sqlvaszrcuj3qy5jh22'
param storageAccounts_mfgt4storage4dev001_name string = 'mfgt4storage4dev002'
param metricAlerts_Function_app_Data_in_name string = 'Function app - Data in'
param components_mfgt_func_app_unzip_blob_dev001_name string = 'mfgt-func-app-unzip-blob-dev001'
param privateEndpoints_mfgt4storageprivateendpoint_name string = 'mfgt4storageprivateendpoint'
param privateDnsZones_privatelink_blob_core_windows_net_name string = 'privatelink.blob.core.windows.net'
param actionGroups_Application_Insights_Smart_Detection_name string = 'Application Insights Smart Detection'
param scheduledqueryrules_Failed_operations_in_function_app_name string = 'Failed operations in function app'
param networkInterfaces_mfgt4storageprivateendpoint_nic_c46a2cdf_5efc_4ec4_b454_565a53c8d6bf_name string = 'mfgt4storageprivateendpoint.nic.c46a2cdf-5efc-4ec4-b454-565a53c8d6bf'
param workspaces_DefaultWorkspace_38fef25a_a926_4719_8c80_de78ac6df0f7_WUS2_externalid string = '/subscriptions/9307b47c-4f32-4c6b-84fe-1a50cb29107f/resourcegroups/sierrawirelesspoc/providers/microsoft.operationalinsights/workspaces/sierrawireless-loganalytics'
param virtualNetworks_AZUSW2_NVN_MXJBL_VNET01_externalid string = '/subscriptions/9307b47c-4f32-4c6b-84fe-1a50cb29107f/resourceGroups/SierraWirelessPoC/providers/Microsoft.Network/virtualNetworks/SierraWireless-VNet'
param subnetName string = 'AZUSW2-NVM-MXJBL-Subnet01'

resource actionGroups_Application_Insights_Smart_Detection_name_resource 'microsoft.insights/actionGroups@2019-06-01' = {
  name: actionGroups_Application_Insights_Smart_Detection_name
  location: 'Global'
  properties: {
    groupShortName: 'SmartDetect'
    enabled: true
    emailReceivers: []
    smsReceivers: []
    webhookReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: [
      {
        name: 'Monitoring Contributor'
        roleId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
        useCommonAlertSchema: true
      }
      {
        name: 'Monitoring Reader'
        roleId: '43d0d8ad-25c7-4714-9337-8ba259a9fe05'
        useCommonAlertSchema: true
      }
    ]
  }
}

resource actionGroups_function_app_name_resource 'microsoft.insights/actionGroups@2019-06-01' = {
  name: actionGroups_function_app_name
  location: 'Global'
  properties: {
    groupShortName: actionGroups_function_app_name
    enabled: true
    emailReceivers: [
      {
        name: 'Leo_-EmailAction-'
        emailAddress: 'lewang@sierrawireless.com'
        useCommonAlertSchema: false
      }
      {
        name: 'DBA_-EmailAction-'
        emailAddress: 'dba_notification@sierrawireless.com'
        useCommonAlertSchema: false
      }
    ]
    smsReceivers: []
    webhookReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}

resource actionGroups_SWIDBA_name_resource 'microsoft.insights/actionGroups@2019-06-01' = {
  name: actionGroups_SWIDBA_name
  location: 'Global'
  properties: {
    groupShortName: actionGroups_SWIDBA_name
    enabled: true
    emailReceivers: [
      {
        name: 'SWI_DBA_Notification_-EmailAction-'
        emailAddress: 'DBA_Notification@sierrawireless.com'
        useCommonAlertSchema: false
      }
    ]
    smsReceivers: []
    webhookReceivers: []
    itsmReceivers: []
    azureAppPushReceivers: []
    automationRunbookReceivers: []
    voiceReceivers: []
    logicAppReceivers: []
    azureFunctionReceivers: []
    armRoleReceivers: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_mfgt_func_app_unzip_blob_dev001_name
  location: 'westus2'
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_DefaultWorkspace_38fef25a_a926_4719_8c80_de78ac6df0f7_WUS2_externalid
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource networkInterfaces_mfgt4storageprivateendpoint_nic_c46a2cdf_5efc_4ec4_b454_565a53c8d6bf_name_resource 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: networkInterfaces_mfgt4storageprivateendpoint_nic_c46a2cdf_5efc_4ec4_b454_565a53c8d6bf_name
  location: 'westus2'
  properties: {
    ipConfigurations: [
      {
        name: 'blob-blob.privateEndpoint'
        properties: {
          privateIPAddress: '10.107.141.5'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: '${virtualNetworks_AZUSW2_NVN_MXJBL_VNET01_externalid}/${subnetName}'
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
  }
}

resource privateDnsZones_privatelink_blob_core_windows_net_name_resource 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: privateDnsZones_privatelink_blob_core_windows_net_name
  location: 'global'
  properties: {
    maxNumberOfRecordSets: 25000
    maxNumberOfVirtualNetworkLinks: 1000
    maxNumberOfVirtualNetworkLinksWithRegistration: 100
    numberOfRecordSets: 2
    numberOfVirtualNetworkLinks: 1
    numberOfVirtualNetworkLinksWithRegistration: 0
    provisioningState: 'Succeeded'
  }
}

resource servers_mfgt_sql_server_dev001_name_resource 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: servers_mfgt_sql_server_dev001_name
  location: 'westus2'
  kind: 'v12.0'
  properties: {
    administratorLogin: 'factorytest'
    administratorLoginPassword: 'Testing123!@#'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource storageAccounts_mfgt4storage4dev001_name_resource 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccounts_mfgt4storage4dev001_name
  location: 'westus2'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
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

resource storageAccounts_sqlvaszrcuj3qy5jh2_name_resource 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccounts_sqlvaszrcuj3qy5jh2_name
  location: 'westus2'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
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

resource serverfarms_ASP_mfgtdatatransfer_b74c_name_resource 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: serverfarms_ASP_mfgtdatatransfer_b74c_name
  location: 'West US 2'
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
    // size: 'Y1'
    // family: 'Y'
    capacity: 0
  }
  kind: 'functionapp'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'degradationindependencyduration'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'degradationinserverresponsetime'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'digestMailConfiguration'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'extension_canaryextension'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'extension_memoryleakextension'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'extension_securityextensionspackage'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'extension_traceseveritydetector'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'longdependencyduration'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'slowpageloadtime'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_mfgt_func_app_unzip_blob_dev001_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'slowserverresponsetime'
  location: 'westus2'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource scheduledqueryrules_Failed_operations_in_function_app_name_resource 'microsoft.insights/scheduledqueryrules@2021-02-01-preview' = {
  name: scheduledqueryrules_Failed_operations_in_function_app_name
  location: 'westus2'
  properties: {
    displayName: scheduledqueryrules_Failed_operations_in_function_app_name
    severity: 1
    enabled: true
    evaluationFrequency: 'PT5M'
    scopes: [
      components_mfgt_func_app_unzip_blob_dev001_name_resource.id
    ]
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          query: 'requests\n| join kind=inner exceptions on operation_Id\n| where success == \'False\'\n| summarize any(timestamp, operation_Id, duration) by innermostMessage'
          timeAggregation: 'Count'
          operator: 'GreaterThanOrEqual'
          threshold: 1
          failingPeriods: {
            numberOfEvaluationPeriods: 1
            minFailingPeriodsToAlert: 1
          }
        }
      ]
    }
    actions: {}
  }
}

resource privateDnsZones_privatelink_blob_core_windows_net_name_storageAccounts_mfgt4storage4dev001_name 'Microsoft.Network/privateDnsZones/SOA@2018-09-01' = {
  parent: privateDnsZones_privatelink_blob_core_windows_net_name_resource
  name: '${storageAccounts_mfgt4storage4dev001_name}'
  properties: {
    metadata: {
      creator: 'created by private endpoint mfgt4storageprivateendpoint with resource guid a1887d67-5e88-4c74-8d21-dc09dae1eb04'
    }
    ttl: 10
    aRecords: [
      {
        ipv4Address: '10.107.141.5'
      }
    ]
  }
}

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_blob_core_windows_net_name 'Microsoft.Network/privateDnsZones/SOA@2018-09-01' = {
  parent: privateDnsZones_privatelink_blob_core_windows_net_name_resource
  name: '@'
  properties: {
    ttl: 3600
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
  }
}

resource privateDnsZones_privatelink_blob_core_windows_net_name_pm6de7ern5xe4 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  parent: privateDnsZones_privatelink_blob_core_windows_net_name_resource
  name: 'pm6de7ern5xe4'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: virtualNetworks_AZUSW2_NVN_MXJBL_VNET01_externalid
    }
  }
}

resource privateEndpoints_mfgt4storageprivateendpoint_name_resource 'Microsoft.Network/privateEndpoints@2020-11-01' = {
  name: privateEndpoints_mfgt4storageprivateendpoint_name
  location: 'westus2'
  properties: {
    privateLinkServiceConnections: [
      {
        name: privateEndpoints_mfgt4storageprivateendpoint_name
        properties: {
          privateLinkServiceId: storageAccounts_mfgt4storage4dev001_name_resource.id
          groupIds: [
            'blob'
          ]
          privateLinkServiceConnectionState: {
            status: 'Approved'
            description: 'Auto-Approved'
            actionsRequired: 'None'
          }
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    subnet: {
      id: '${virtualNetworks_AZUSW2_NVN_MXJBL_VNET01_externalid}/${subnetName}'
    }
    customDnsConfigs: []
  }
}

resource servers_mfgt_sql_server_dev001_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_mfgt_sql_server_dev001_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_mfgt_sql_server_dev001_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_mfgt_sql_server_dev001_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_mfgt_sql_server_dev001_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource servers_mfgt_sql_server_dev001_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'default'
  location: 'West US 2'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_mfgt_sql_server_dev001_name_Default 'Microsoft.Sql/servers/auditingSettings@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production 'Microsoft.Sql/servers/databases@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'mfgt_db_production'
  location: 'westus2'
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 2
  }
  kind: 'v12.0,user,vcore'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/9307b47c-4f32-4c6b-84fe-1a50cb29107f/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
}

resource servers_mfgt_sql_server_dev001_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Default'
  location: 'West US 2'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_mfgt_sql_server_dev001_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-02-01-preview' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_mfgt_sql_server_dev001_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-02-01-preview' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_mfgt_sql_server_dev001_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Default'
  location: 'West US 2'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-02-01-preview' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_mfgt_sql_server_dev001_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-02-01-preview' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_mfgt_sql_server_dev001_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-02-01-preview' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_mfgt_sql_server_dev001_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-02-01-preview' = {
  name: '${servers_mfgt_sql_server_dev001_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_mfgt_sql_server_dev001_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: true
    state: 'Disabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
}

resource servers_mfgt_sql_server_dev001_name_current 'Microsoft.Sql/servers/encryptionProtector@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_mfgt_sql_server_dev001_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: [
      'SUCCESSFUL_DATABASE_AUTHENTICATION_GROUP'
      'FAILED_DATABASE_AUTHENTICATION_GROUP'
      'BATCH_COMPLETED_GROUP'
    ]
    isAzureMonitorTargetEnabled: true
    state: 'Enabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
}

resource servers_mfgt_sql_server_dev001_name_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource servers_mfgt_sql_server_dev001_name_Azadeh_home 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'Azadeh @ home'
  properties: {
    startIpAddress: '174.1.53.230'
    endIpAddress: '174.1.53.230'
  }
}

resource servers_mfgt_sql_server_dev001_name_Jeff_home 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'Jeff @ home'
  properties: {
    startIpAddress: '96.48.108.222'
    endIpAddress: '96.48.108.222'
  }
}

resource servers_mfgt_sql_server_dev001_name_on_Prem 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'on_Prem'
  properties: {
    startIpAddress: '208.81.120.1'
    endIpAddress: '208.81.120.1'
  }
}

resource servers_mfgt_sql_server_dev001_name_query_editor_3f1f00 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'query-editor-3f1f00'
  properties: {
    startIpAddress: '50.67.13.3'
    endIpAddress: '50.67.13.3'
  }
}

resource servers_mfgt_sql_server_dev001_name_ServiceManaged 'Microsoft.Sql/servers/keys@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource servers_mfgt_sql_server_dev001_name_mfgtdevdbserverPrivateEndpoint_ba187eea_c115_4086_977d_e236bc0a1745 'Microsoft.Sql/servers/privateEndpointConnections@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'mfgtdevdbserverPrivateEndpoint-ba187eea-c115-4086-977d-e236bc0a1745'
  properties: {}
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_mfgt_sql_server_dev001_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'Default'
  properties: {
    state: 'Enabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource storageAccounts_mfgt4storage4dev001_name_default 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_sqlvaszrcuj3qy5jh2_name_default 'Microsoft.Storage/storageAccounts/blobServices@2021-04-01' = {
  parent: storageAccounts_sqlvaszrcuj3qy5jh2_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      enabled: false
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_mfgt4storage4dev001_name_default 'Microsoft.Storage/storageAccounts/fileServices@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_sqlvaszrcuj3qy5jh2_name_default 'Microsoft.Storage/storageAccounts/fileServices@2021-04-01' = {
  parent: storageAccounts_sqlvaszrcuj3qy5jh2_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_mfgt4storage4dev001_name_storageAccounts_mfgt4storage4dev001_name_d91382c7_d522_4eff_be8a_f366c4dfd3ab 'Microsoft.Storage/storageAccounts/privateEndpointConnections@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_resource
  name: '${storageAccounts_mfgt4storage4dev001_name}.d91382c7-d522-4eff-be8a-f366c4dfd3ab'
  properties: {
    provisioningState: 'Succeeded'
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      description: 'Auto-Approved'
      actionRequired: 'None'
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_mfgt4storage4dev001_name_default 'Microsoft.Storage/storageAccounts/queueServices@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_sqlvaszrcuj3qy5jh2_name_default 'Microsoft.Storage/storageAccounts/queueServices@2021-04-01' = {
  parent: storageAccounts_sqlvaszrcuj3qy5jh2_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_mfgt4storage4dev001_name_default 'Microsoft.Storage/storageAccounts/tableServices@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_sqlvaszrcuj3qy5jh2_name_default 'Microsoft.Storage/storageAccounts/tableServices@2021-04-01' = {
  parent: storageAccounts_sqlvaszrcuj3qy5jh2_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_resource 'Microsoft.Web/sites@2021-01-15' = {
  name: sites_mfgt_func_app_unzip_blob_dev001_name
  location: 'West US 2'
  kind: 'functionapp'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_mfgt_func_app_unzip_blob_dev001_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_mfgt_func_app_unzip_blob_dev001_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_mfgtdatatransfer_b74c_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: 'AFAB7E79DA76C4BCB9EB221E1FAA35ED8E9783478A93C6B2EA002C49C7AAD15D'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'ftp'
  location: 'West US 2'
  properties: {
    allow: true
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'scm'
  location: 'West US 2'
  properties: {
    allow: true
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_web 'Microsoft.Web/sites/config@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'web'
  location: 'West US 2'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v4.0'
    phpVersion: '5.6'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2019'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$mfgt-func-app-unzip-blob-dev001'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 1
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.0'
    ftpsState: 'AllAllowed'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 200
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_06a3efbaea6e4af2aa1e7cd1be90fac6 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '06a3efbaea6e4af2aa1e7cd1be90fac6'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 6:18:15 PM'
    end_time: '9/29/2021 6:18:17 PM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_0fa23004509c45e785e1b0696a02806a 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '0fa23004509c45e785e1b0696a02806a'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 6:50:31 AM'
    end_time: '9/29/2021 6:50:33 AM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_21d8783eee6348908028c3ea05d2b59f 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '21d8783eee6348908028c3ea05d2b59f'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 6:16:56 AM'
    end_time: '9/29/2021 6:16:59 AM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_23ced7f3d97c4129b6e3780e06c9ea9a 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '23ced7f3d97c4129b6e3780e06c9ea9a'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 5:21:38 PM'
    end_time: '9/29/2021 5:21:41 PM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_2db49f00cb84455b94cdd036a72d767c 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '2db49f00cb84455b94cdd036a72d767c'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 4:40:07 PM'
    end_time: '9/29/2021 4:40:09 PM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_728074b0fe254539a6ad48ad5056244a 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '728074b0fe254539a6ad48ad5056244a'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 5:00:52 PM'
    end_time: '9/29/2021 5:00:55 PM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_a5a32c54cdd44a0a9ede740383afd07e 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'a5a32c54cdd44a0a9ede740383afd07e'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '10/2/2021 6:42:16 PM'
    end_time: '10/2/2021 6:42:18 PM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_b29d7fb246ca459fbdd8b99c1f473a96 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'b29d7fb246ca459fbdd8b99c1f473a96'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '10/2/2021 7:12:38 PM'
    end_time: '10/2/2021 7:12:40 PM'
    active: true
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_b366ea886e184744a0943c235b98d2fe 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'b366ea886e184744a0943c235b98d2fe'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/29/2021 6:41:38 AM'
    end_time: '9/29/2021 6:41:40 AM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_c7bfb1c691f7412da011e9e7177a3b21 'Microsoft.Web/sites/deployments@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'c7bfb1c691f7412da011e9e7177a3b21'
  location: 'West US 2'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'VS Code'
    deployer: 'ZipDeploy'
    message: 'Created via a push deployment'
    start_time: '9/30/2021 5:10:53 PM'
    end_time: '9/30/2021 5:10:55 PM'
    active: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_BlobTriggerMfgt 'Microsoft.Web/sites/functions@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: 'BlobTriggerMfgt'
  location: 'West US 2'
  properties: {
    script_root_path_href: 'https://mfgt-func-app-unzip-blob-dev001.azurewebsites.net/admin/vfs/site/wwwroot/BlobTriggerMfgt/'
    script_href: 'https://mfgt-func-app-unzip-blob-dev001.azurewebsites.net/admin/vfs/site/wwwroot/bin/Azure_function_app.dll'
    config_href: 'https://mfgt-func-app-unzip-blob-dev001.azurewebsites.net/admin/vfs/site/wwwroot/BlobTriggerMfgt/function.json'
    test_data_href: 'https://mfgt-func-app-unzip-blob-dev001.azurewebsites.net/admin/vfs/data/Functions/sampledata/BlobTriggerMfgt.dat'
    href: 'https://mfgt-func-app-unzip-blob-dev001.azurewebsites.net/admin/functions/BlobTriggerMfgt'
    config: {}
    language: 'DotNetAssembly'
    isDisabled: false
  }
}

resource sites_mfgt_func_app_unzip_blob_dev001_name_sites_mfgt_func_app_unzip_blob_dev001_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2021-01-15' = {
  parent: sites_mfgt_func_app_unzip_blob_dev001_name_resource
  name: '${sites_mfgt_func_app_unzip_blob_dev001_name}.azurewebsites.net'
  location: 'West US 2'
  properties: {
    siteName: 'mfgt-func-app-unzip-blob-dev001'
    hostNameType: 'Verified'
  }
}

resource metricAlerts_Connection_failure_name_resource 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_Connection_failure_name
  location: 'global'
  properties: {
    description: '20210929RuleAdded'
    severity: 2
    enabled: true
    scopes: [
      servers_mfgt_sql_server_dev001_name_mfgt_db_production.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 0
          name: 'Metric1'
          metricNamespace: 'Microsoft.Sql/servers/databases'
          metricName: 'connection_failed'
          operator: 'GreaterThan'
          timeAggregation: 'Total'
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'Microsoft.Sql/servers/databases'
    actions: [
      {
        actionGroupId: actionGroups_SWIDBA_name_resource.id
        webHookProperties: {}
      }
    ]
  }
}

resource metricAlerts_Function_app_Data_in_name_resource 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: metricAlerts_Function_app_Data_in_name
  location: 'global'
  properties: {
    description: 'Condition: data in. For testing purpose.'
    severity: 3
    enabled: false
    scopes: [
      sites_mfgt_func_app_unzip_blob_dev001_name_resource.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      allOf: [
        {
          threshold: 1000
          name: 'Metric1'
          metricNamespace: 'Microsoft.Web/sites'
          metricName: 'BytesReceived'
          operator: 'GreaterThan'
          timeAggregation: 'Total'
          criterionType: 'StaticThresholdCriterion'
        }
      ]
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
    }
    autoMitigate: true
    targetResourceType: 'Microsoft.Web/sites'
    actions: [
      {
        actionGroupId: actionGroups_function_app_name_resource.id
        webHookProperties: {}
      }
    ]
  }
}

resource privateEndpoints_mfgt4storageprivateendpoint_name_default 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2020-11-01' = {
  parent: privateEndpoints_mfgt4storageprivateendpoint_name_resource
  name: 'default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink-blob-core-windows-net'
        properties: {
          privateDnsZoneId: privateDnsZones_privatelink_blob_core_windows_net_name_resource.id
        }
      }
    ]
  }
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  location: 'West US 2'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_mfgt_sql_server_dev001_name_mfgt_db_production_Default 'Microsoft.Sql/servers/databases/auditingSettings@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_mfgt_sql_server_dev001_name_mfgt_db_production_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_mfgt_sql_server_dev001_name_mfgt_db_production_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_mfgt_sql_server_dev001_name_mfgt_db_production_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '9307b47c-4f32-4c6b-84fe-1a50cb29107f'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_mfgt_sql_server_dev001_name_mfgt_db_production_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2014-04-01' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'Default'
  location: 'West US 2'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource servers_mfgt_sql_server_dev001_name_mfgt_db_production_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'current'
  properties: {}
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_mfgt_sql_server_dev001_name_mfgt_db_production_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_mfgt_sql_server_dev001_name_mfgt_db_production_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_mfgt_sql_server_dev001_name_mfgt_db_production_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_mfgt_db_production
  name: 'default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  dependsOn: [
    servers_mfgt_sql_server_dev001_name_resource
  ]
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_mfgt_sql_server_dev001_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2021-02-01-preview' = {
  parent: servers_mfgt_sql_server_dev001_name_resource
  name: 'default'
  properties: {
    storageContainerPath: 'https://${storageAccounts_sqlvaszrcuj3qy5jh2_name}.blob.core.windows.net/vulnerability-assessment/'
    recurringScans: {
      isEnabled: true
      emailSubscriptionAdmins: true
      emails: []
    }
  }
  dependsOn: [
    storageAccounts_sqlvaszrcuj3qy5jh2_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_azure_webjobs_hosts 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_default
  name: 'azure-webjobs-hosts'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_azure_webjobs_secrets 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_default
  name: 'azure-webjobs-secrets'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_blob_archived 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_default
  name: 'blob-archived'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_blob_from_test_stations 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_default
  name: 'blob-from-test-stations'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_output_files 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: storageAccounts_mfgt4storage4dev001_name_default
  name: 'output-files'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_sqlvaszrcuj3qy5jh2_name_default_vulnerability_assessment 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  parent: storageAccounts_sqlvaszrcuj3qy5jh2_name_default
  name: 'vulnerability-assessment'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_sqlvaszrcuj3qy5jh2_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_mfgt_func_app_unzip_blob_dev00199e7 'Microsoft.Storage/storageAccounts/fileServices/shares@2021-04-01' = {
  parent: Microsoft_Storage_storageAccounts_fileServices_storageAccounts_mfgt4storage4dev001_name_default
  name: 'mfgt-func-app-unzip-blob-dev00199e7'
  properties: {
    accessTier: 'TransactionOptimized'
    shareQuota: 5120
    enabledProtocols: 'SMB'
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_azure_webjobs_blobtrigger_mfgt_func_app_unzip_blob_dev001 'Microsoft.Storage/storageAccounts/queueServices/queues@2021-04-01' = {
  parent: Microsoft_Storage_storageAccounts_queueServices_storageAccounts_mfgt4storage4dev001_name_default
  name: 'azure-webjobs-blobtrigger-mfgt-func-app-unzip-blob-dev001'
  properties: {
    metadata: {}
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}

resource storageAccounts_mfgt4storage4dev001_name_default_webjobs_blobtrigger_poison 'Microsoft.Storage/storageAccounts/queueServices/queues@2021-04-01' = {
  parent: Microsoft_Storage_storageAccounts_queueServices_storageAccounts_mfgt4storage4dev001_name_default
  name: 'webjobs-blobtrigger-poison'
  properties: {
    metadata: {}
  }
  dependsOn: [
    storageAccounts_mfgt4storage4dev001_name_resource
  ]
}