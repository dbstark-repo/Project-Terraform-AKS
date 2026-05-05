terraform {
  backend "azurerm" {
    resource_group_name = "terraform-state-rg"
    storage_account_name = "stagetfstate5681"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}