resource "azurerm_kubernetes_cluster" "main" {
  name                       = "${var.environment}-${var.name_prefix}-aks"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  automatic_upgrade_channel  = var.automatic_upgrade_channel
  node_os_upgrade_channel    = var.node_os_upgrade_channel
  oidc_issuer_enabled        = var.oidc_issuer_enabled
  sku_tier                   = var.sku_tier
  kubernetes_version         = var.kubernetes_version
  tags                       = var.tags
  dns_prefix_private_cluster = var.dns_prefix_private_cluster
  private_cluster_enabled    = var.private_cluster_enabled
  private_dns_zone_id        = azurerm_private_dns_zone.main.id

  default_node_pool {
    name                         = var.system_node_pool.name
    vm_size                      = var.system_node_pool.vm_size
    zones                        = var.system_node_pool.zones
    temporary_name_for_rotation  = var.temporary_name_for_rotation
    auto_scaling_enabled         = var.system_node_pool.auto_scaling_enabled
    type                         = var.system_node_pool.type
    node_public_ip_enabled       = var.system_node_pool.node_public_ip_enabled
    only_critical_addons_enabled = var.system_node_pool.only_critical_addons_enabled
    os_sku                       = var.system_node_pool.os_sku
    vnet_subnet_id               = azurerm_subnet.main["aks"].id
    max_count                    = var.system_node_pool.max_count
    min_count                    = var.system_node_pool.min_count
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  kubelet_identity {
    client_id                 = azurerm_user_assigned_identity.aks.client_id
    object_id                 = azurerm_user_assigned_identity.aks.principal_id
    user_assigned_identity_id = azurerm_user_assigned_identity.aks.id
  }

  azure_active_directory_role_based_access_control {
    tenant_id              = data.azurerm_client_config.current.tenant_id
    admin_group_object_ids = var.admin_group_object_ids
    azure_rbac_enabled     = var.azure_rbac_enabled
  }

  network_profile {
    network_plugin      = var.network_plugin
    network_policy      = var.network_policy
    network_data_plane  = var.network_data_plane
    network_plugin_mode = var.network_plugin_mode
    pod_cidr            = var.pod_cidr
    load_balancer_sku   = var.load_balancer_sku
  }

  workload_autoscaler_profile {
    keda_enabled                    = var.keda_enabled
    vertical_pod_autoscaler_enabled = var.vertical_pod_autoscaler_enabled
  }

  depends_on = [azurerm_role_assignment.managed_identity_operator,
  azurerm_role_assignment.pdz_contributor]
}

resource "azurerm_kubernetes_cluster_node_pool" "main" {
  for_each = var.node_pools

  name                        = each.key
  kubernetes_cluster_id       = azurerm_kubernetes_cluster.main.id
  vm_size                     = each.value.vm_size
  auto_scaling_enabled        = each.value.auto_scaling_enabled
  node_public_ip_enabled      = each.value.node_public_ip_enabled
  max_pods                    = each.value.max_pods
  mode                        = each.value.mode
  node_labels                 = each.value.node_labels
  orchestrator_version        = each.value.orchestrator_version
  os_sku                      = each.value.os_sku
  temporary_name_for_rotation = var.temporary_name_for_rotation
  vnet_subnet_id              = azurerm_subnet.main["aks"].id
  zones                       = each.value.zones
  max_count                   = each.value.max_count
  min_count                   = each.value.min_count
  tags                        = var.tags
}