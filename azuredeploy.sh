az group create -n hectagon-servicebus -l australiasoutheast
az group deployment create --name provision --resource-group hectagon-servicebus --template-file servicebus.json --parameters serviceBusNamespaceName=hectagon
