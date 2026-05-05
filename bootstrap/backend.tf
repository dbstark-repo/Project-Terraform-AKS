terraform {
  backend "azurerm" {
    resource_group_name = "terraform-bootstrap-rg"
    storage_account_name = "bstrptfstate9594"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}