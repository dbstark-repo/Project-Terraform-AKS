#! /bin/bash

# This script is used to remove the azure resources that were created for the remote state of terraform.
# It will remove the resource group and all the resources inside it.
# Usage: ./remove-azure-resources.sh <resource-group-name>

if [ -z "$1" ]; then
  echo "Please provide the resource group name as an argument."
  echo "Usage: $0 <resource-group-name>"
  exit 1
fi

RESOURCE_GROUP_NAME="$1"

# Delete the resource group and all its resources
az group delete --name $RESOURCE_GROUP_NAME --yes
echo "Resource group '$RESOURCE_GROUP_NAME' and all its resources have been deleted."
