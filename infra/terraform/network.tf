resource "azurerm_network_security_group" "main" {
  name                = "${var.environment}-${var.name_prefix}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.environment}-${var.name_prefix}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "main" {
  for_each = var.subnets

  name                 = "${var.environment}-${var.name_prefix}-${each.key}-snet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_private_dns_zone" "main" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "main" {
  name                  = "${var.environment}-${var.name_prefix}-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = azurerm_virtual_network.main.id
}