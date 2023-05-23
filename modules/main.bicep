param deployApp bool = true

module storageModule './modules/storage.bicep'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: '${replace(resourceGroup().name, ' ', '-')}-asp'
  location: resourceGroup().location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource webApp 'Microsoft.Web/sites@2021-02-01' = if (deployApp) {
  name: '${replace(resourceGroup().name, ' ', '-')}-app'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'MYSECRET'
          value: 'your_secret_value'
        }
      ]
    }
  }
}
