
variable "location" {
  type = string
  description = "Location of the resource group"
}

variable "environment" {
  type = string
  description = "Environment name"
}

variable "ssh_public_key" {
  type = string
}