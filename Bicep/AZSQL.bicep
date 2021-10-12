param deploymentInfo object
param stage object

var azSqlInfo = deploymentInfo.azSqlInfo

module SA 'AZSQL-SQL.bicep' = [for (azsql, index) in azSqlInfo: {
  name: 'dp-azSqlDeploy-${(length(azSqlInfo))}'
  params: {
    azSqlInfo: azsql
  }
}]
