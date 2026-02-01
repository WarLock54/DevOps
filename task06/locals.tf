locals {
  rg_name = format("%s-rg", var.resources_name_prefix)

  sql_server_name = var.sql_server_name
  sql_db_name     = var.sql_db_name
  asp_name        = var.asp_name
  app_name        = var.app_name

  common_tags = {
    Creator = var.student_email
  }
}