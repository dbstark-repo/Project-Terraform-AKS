#! /bin/bash

# This script is used to set up remote storage for Terraform state files in Azure Blob Storage.
# It creates a resource group, storage account, and blob container for storing the Terraform state.

# Variables
RESOURCE_GROUP_NAME="terraform-bootstrap-rg"
BOOT_STORAGE_ACCOUNT_NAME="bstrptfstate$RANDOM"
CONTAINER_NAME="tfstate"
LOCATION="eastus"

# Create Resource Group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create boot Storage Account
az storage account create --name $BOOT_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS

# Create Blob Container for boot Storage Account
az storage container create --name $CONTAINER_NAME --account-name $BOOT_STORAGE_ACCOUNT_NAME

# Output the storage account details for Terraform configuration
echo "Resource Group Name: $RESOURCE_GROUP_NAME"
echo "Bootstrap Storage Account Name: $BOOT_STORAGE_ACCOUNT_NAME"
echo "Bootstrap Container Name: $CONTAINER_NAME"