# # Synapse workspace

module "synapse_workspace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/synapse/synapse-workspace"

  basename             = local.basename
  resource_group_name  = local.resource_group_name
  location             = local.location
  adls_id              = module.storage_account_syn.adls_id
  storage_account_id   = module.storage_account_syn.id
  storage_account_name = module.storage_account_syn.name

  synadmin_username = var.synadmin_username
  synadmin_password = var.synadmin_password

  aad_login = {
    name      = var.aad_login.name
    object_id = var.aad_login.object_id
    tenant_id = var.aad_login.tenant_id
  }

  module_enabled      = true
  is_private_endpoint = local.enable_private_endpoints

  tags = local.tags
}

# Synapse Spark pool

module "synapse_spark_pool" {
  source = "github.com/Azure/azure-data-labs-modules.git//terraform/synapse/synapse-spark-pool"

  basename             = local.safe_basename
  synapse_workspace_id = module.synapse_workspace.id

  spark_version = 3.3

  module_enabled = local.enable_synapse_spark_pool
}

# Synapse SQL pool

module "synapse_sql_pool" {
  source = "github.com/Azure/azure-data-labs-modules.git//terraform/synapse/synapse-sql-pool"

  basename             = local.safe_basename
  synapse_workspace_id = module.synapse_workspace.id

  module_enabled = local.enable_synapse_sql_pool
}
