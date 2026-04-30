resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

# Reading outputs from the remote state
data "terraform_remote_state" "bootstrap" {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform-bootstrap-rg"
    storage_account_name = "bstrptfstate9594"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

locals {
  common_tags = {
    "nodepool-type"    = "system"
    "environment"      = var.environment
    "nodepools"       = "linux"
  }
}

# creating the resources for the environment
module "resourcegroup" {
  source = "../../modules/resourcegroup"
  resource_group_name = "rg-${var.environment}-${random_string.suffix.result}"
  location = var.location
}

module "keyvault" {
  source = "../../modules/keyvault"
  location = module.resourcegroup.location
  resource_group_name = module.resourcegroup.resource_group_name
  keyvault_name = "kv-dev-${random_string.suffix.result}"
}

module "identity" {
  source = "../../modules/identity"
  location = module.resourcegroup.location
  resource_group_name = module.resourcegroup.resource_group_name
}

module "AKS" {
  source = "../../modules/AKS"
  location = module.resourcegroup.location
  resource_group_name = module.resourcegroup.resource_group_name
  aks_cluster_name = "aks-dev-${random_string.suffix.result}"
  user_assigned_identity_id = module.identity.user_assigned_identity_id
  environment = var.environment
  tags = local.common_tags
  node_labels = local.common_tags 
  depends_on = [ module.identity ]
}

resource "local_file" "kubeconfig" {
  depends_on   = [module.AKS]
  filename     = "./kubeconfig"
  content      = module.AKS.config 
}