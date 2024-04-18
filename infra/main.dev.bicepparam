using './main.bicep'

param environmentShortName = readEnvironmentVariable('environment', 'd')
param resourceBaseName = 'dev-dataplatform'
param location = 'swedencentral'

param skuName = 'Standard'
param skuTier = 'Standard'
param capacity = 10
param maxSizeBytes = 268435456000 // 250GB (max) size
