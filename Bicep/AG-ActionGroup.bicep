param actionGroupInfo object

resource AG 'microsoft.insights/actionGroups@2019-06-01' = {
  name: toLower('${actionGroupInfo.namePrefix}sa${actionGroupInfo.nameSuffix}')
  location: 'Global'
  properties: {
    groupShortName: 'SmartDetect'
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
    armRoleReceivers: [
      {
        name: 'Monitoring Contributor'
        roleId: '749f88d5-cbae-40b8-bcfc-e573ddc772fa'
        useCommonAlertSchema: actionGroupInfo.commonAlertSchema
      }
      {
        name: 'Monitoring Reader'
        roleId: '43d0d8ad-25c7-4714-9337-8ba259a9fe05'
        useCommonAlertSchema: actionGroupInfo.commonAlertSchema
      }
    ]
  }
}
