# Common
variable "resource_group_name" {}
variable "location" {}
variable "name_prefix" {}
variable "environment" {}
variable "tags" {}

# Vnet
variable "vnet_address_space" {}
variable "vnet_dns_servers" {}
variable "subnets" {}
variable "private_dns_zone_name" {}

# AKS
variable "private_cluster_enabled" {}
variable "network_plugin" {}
variable "network_policy" {}
variable "network_data_plane" {}
variable "network_plugin_mode" {}
variable "pod_cidr" {}
variable "load_balancer_sku" {}
variable "keda_enabled" {}
variable "vertical_pod_autoscaler_enabled" {}
variable "admin_group_object_ids" {}
variable "automatic_upgrade_channel" {}
variable "node_os_upgrade_channel" {}
variable "oidc_issuer_enabled" {}
variable "sku_tier" {}
variable "dns_prefix_private_cluster" {}
variable "kubernetes_version" {}
variable "temporary_name_for_rotation" {}
variable "system_node_pool" {}
variable "azure_rbac_enabled" {}
variable "node_pools" {}