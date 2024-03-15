# Data Factory

module "data_factory" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/data-factory/data-factory"

  basename            = local.basename
  resource_group_name = local.resource_group_name
  location            = local.location

  module_enabled      = local.enable_data_factory
  is_private_endpoint = local.enable_private_endpoints

  tags = local.tags
}