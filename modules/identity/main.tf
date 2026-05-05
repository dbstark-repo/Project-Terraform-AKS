# user assigned identity module
resource "azurerm_user_assigned_identity" "mi" {
  location            = var.location
  name                = "${var.resource_group_name}-identity"
  resource_group_name = var.resource_group_name
}