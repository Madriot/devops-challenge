# Common
resource_group_name = "![RG_NAME]"
location            = "West Europe"
name_prefix         = "![NAME_PREFIX]"
environment         = "dev"

tags = {
  Environment = "DEV"
}

# Network
vnet_address_space    = ["10.10.11.0/24"]
vnet_dns_servers      = ["10.10.11.4", "10.10.11.5"]
private_dns_zone_name = "privatelink.westeurope.azmk8s.io"

subnets = {
  "aks" = {
    address_prefixes = ["10.10.11.0/26"]
  }
}

# AKS
private_cluster_enabled         = true
automatic_upgrade_channel       = "stable"
node_os_upgrade_channel         = "SecurityPatch"
oidc_issuer_enabled             = true
sku_tier                        = "Free"
kubernetes_version              = "1.33"
temporary_name_for_rotation     = "tempnodes"
network_plugin                  = "azure"
network_policy                  = "azure"
network_data_plane              = "azure"
network_plugin_mode             = "overlay"
pod_cidr                        = "172.10.0.0/16"
load_balancer_sku               = "standard"
keda_enabled                    = true
vertical_pod_autoscaler_enabled = false
azure_rbac_enabled              = true
admin_group_object_ids          = ["![ENTRAID_ADMIN_GROUP_ID]"]
dns_prefix_private_cluster      = "![AKS_DNS_PREFIX]"

system_node_pool = {
  name                         = "system"
  node_count                   = 1
  zones                        = ["2"]
  vm_size                      = "Standard_B2s"
  auto_scaling_enabled         = true
  type                         = "VirtualMachineScaleSets"
  node_public_ip_enabled       = false
  only_critical_addons_enabled = true
  os_sku                       = "Ubuntu"
  min_count                    = 1
  max_count                    = 1
}

node_pools = {
  app = {
    node_count             = 1
    vm_size                = "Standard_B2s"
    zones                  = ["2"]
    max_count              = 1
    min_count              = 1
    auto_scaling_enabled   = true
    node_public_ip_enabled = false
    max_pods               = 29
    mode                   = "User"
    orchestrator_version   = "1.33"
    os_sku                 = "Ubuntu"

    node_labels = {
      "app" = "challenge"
    }
} }