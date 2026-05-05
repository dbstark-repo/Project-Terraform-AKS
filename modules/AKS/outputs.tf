# outputs for AKS module

output "config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "tags" {
  value = azurerm_kubernetes_cluster.aks.tags
}

output "node_labels" {
  value = azurerm_kubernetes_cluster.aks.default_node_pool[0].node_labels
}
