variable "resource_group_name" {
  description = "AKS cluster resource group name"
  type = string
}

variable "location" {
  description = "AKS cluster resource group location"
  type = string
}

variable "aks_cluster_name" {
  description = "AKS cluster name"
  type = string
}

variable "environment" {
  description = "Environment tag for the resources"
  type = string
}

variable "ssh_public_key"{
  description = "Path to the SSH public key for AKS cluster access"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "user_assigned_identity_id" {
  description = "User Assigned Identity ID for AKS cluster"
  type = string
}

variable "tags" {
  type = map(string)
}

variable "node_labels" {
  type = map(string)
}


