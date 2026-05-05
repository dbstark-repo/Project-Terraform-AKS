terraform {
  backend "azurerm" {
    resource_group_name = "terraform-state-rg"
    storage_account_name = "devtfstate5728"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}