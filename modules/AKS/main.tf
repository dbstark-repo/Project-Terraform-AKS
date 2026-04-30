data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false  
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  dns_prefix          = "${var.aks_cluster_name}-dns"
  node_resource_group = "${var.aks_cluster_name}-nrg"
  tags = var.tags
  
  identity {
    type = "UserAssigned"
    identity_ids = [var.user_assigned_identity_id]
  }

 default_node_pool {
    name       = "defaultpool"
    vm_size    = "Standard_DS2_v2"
    zones   = ["1", "2", "3"]
    auto_scaling_enabled = true
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = var.node_labels
    tags = var.tags
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
        key_data = trimspace(file(var.ssh_public_key))
    }
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }  
}