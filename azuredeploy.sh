#!/bin/sh
if [ $# -eq 0 ]
  then
    ENVIRONMENT=hectagon
else
    ENVIRONMENT=$1
fi

echo "Setting up environment '$ENVIRONMENT'..."
RGNAME="$1-servicebus"
az group create -n $RGNAME -l australiasoutheast
export AZURE_SERVICEBUS_CONNECTION_STRING=$(az group deployment create --name provision --resource-group $RGNAME --template-file servicebus.json --parameters serviceBusNamespaceName=$ENVIRONMENT --query "properties.outputs.namespaceDefaultConnectionString.value" -o tsv)
echo "Connection string is $AZURE_SERVICEBUS_CONNECTION_STRING"