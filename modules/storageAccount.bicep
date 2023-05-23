param location string
param kind string
param accessTier string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: '${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: kind
  properties: {
    accessTier: accessTier
  }
}
