@description('Location for all resources')
param location string = resourceGroup().location

@description('Common base name of resources to deploy')
param resourceBaseName string

@description('Environment in short format (d, t, q, p)')
param environmentShortName string

@description('The SKU name for the database (e.g., Basic, Standard, Premium)')
param skuName string

@description('The tier (edition) of the database (e.g., Basic, Standard, Premium)')
param skuTier string

@description('The capacity or performance level within the chosen SKU')
param capacity int

@description('The maximum size of the database in bytes')
param maxSizeBytes int

var sqlServerName = '${resourceBaseName}-${environmentShortName}-sql'

module server 'br/public:avm/res/sql/server:0.3.0' = {
  name: 'serverDeployment'
  params: {
    name: sqlServerName

    location: location

    databases: [
      {
        name: '${resourceBaseName}-${environmentShortName}-sqldb'
        collation: 'SQL_Latin1_General_CP1_CI_AS'
        skuName: skuName
        skuTier: skuTier
        capacity: capacity
        maxSizeBytes: maxSizeBytes
      }
    ]
  }
}
