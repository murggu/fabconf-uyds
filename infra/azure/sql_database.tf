# SQL database

module "sql_database_server" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/sql-database-server"

  basename            = local.safe_basename
  resource_group_name = local.resource_group_name
  location            = local.location

  db_version                   = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "ThisIsNotVerySecure!"

  module_enabled      = true
  is_private_endpoint = local.enable_private_endpoints

  tags = local.tags
}

/* module "sql_database" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/sql-database"

  basename  = local.safe_basename
  server_id = module.sql_database_server.id
  collation = "SQL_Latin1_General_CP1_CI_AS"

  module_enabled = true

  tags = local.tags
} */