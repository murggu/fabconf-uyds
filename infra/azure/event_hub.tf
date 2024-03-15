module "event_hubs_namespace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/event-hubs/event-hubs-namespace"

  basename            = local.basename
  resource_group_name = local.resource_group_name
  location            = local.location

  zone_redundant = false

  module_enabled      = local.enable_event_hub
  is_private_endpoint = local.enable_private_endpoints

  tags = local.tags
}