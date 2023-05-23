param storageAccountNames array = ['<yourname>finalexam1', '<yourname>finalexam2']

module storageAccounts './storageAccount.bicep' = [
  for name in storageAccountNames: {
    name: name
    params: {
      location: resourceGroup().location
      kind: 'StorageV2'
      accessTier: 'Hot'
    }
  }
]
