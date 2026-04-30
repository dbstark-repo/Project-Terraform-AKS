#! /bin/bash

# This script is used to set up remote storage for Terraform state files in Azure Blob Storage.
# It creates a resource group, storage account, and blob container for storing the Terraform state.

# Variables
RESOURCE_GROUP_NAME="terraform-state-rg"
DEV_STORAGE_ACCOUNT_NAME="devtfstate$RANDOM"
STAGE_STORAGE_ACCOUNT_NAME="stagetfstate$RANDOM"
CONTAINER_NAME="tfstate"
LOCATION="eastus"

# Create Resource Group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create dev Storage Account
az storage account create --name $DEV_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS

# Create stage Storage Account
az storage account create --name $STAGE_STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --sku Standard_LRS

# Create Blob Container for dev Storage Account
az storage container create --name $CONTAINER_NAME --account-name $DEV_STORAGE_ACCOUNT_NAME

# Create Blob Container for stage Storage Account
az storage container create --name $CONTAINER_NAME --account-name $STAGE_STORAGE_ACCOUNT_NAME

# Output the storage account details for Terraform configuration
echo "Resource Group Name: $RESOURCE_GROUP_NAME"
echo "Dev Storage Account Name: $DEV_STORAGE_ACCOUNT_NAME"
echo "Dev Container Name: $CONTAINER_NAME"
echo "Stage Storage Account Name: $STAGE_STORAGE_ACCOUNT_NAME"
echo "Stage Container Name: $CONTAINER_NAME"

