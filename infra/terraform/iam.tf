# Identities
resource "azurerm_user_assigned_identity" "aks" {
  name                = "${var.environment}-${var.name_prefix}-aks-id"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_user_assigned_identity" "kubelet" {
  name                = "${var.environment}-${var.name_prefix}-kubelet-id"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "managed_identity_operator" {
  role_definition_name = "Managed Identity Operator"
  scope                = data.azurerm_resource_group.main.id
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}

resource "azurerm_role_assignment" "pdz_contributor" {
  role_definition_name = "Private DNS Zone Contributor"
  scope                = azurerm_private_dns_zone.main.id
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}

