locals {
  rg_name         = format("%s-rg", var.resources_name_prefix)
  sql_server_name = format("%s-sql", var.resources_name_prefix)
  sql_db_name     = format("%s-sql-db", var.resources_name_prefix)
  asp_name        = format("%s-asp", var.resources_name_prefix)
  app_name        = format("%s-app", var.resources_name_prefix)
  common_tags = {
    Creator = "onur_atalik@epam.com"
  }
}