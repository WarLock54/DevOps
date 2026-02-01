locals {
  rg_name         = format("%s-rg", var.resources_name_prefix)
  sql_server_name = format("%s", var.sql_server_name)
  sql_db_name     = format("%s", var.sql_db_name)
  asp_name        = format("%s", var.asp_name)
  app_name        = format("%s", var.app_name)

  common_tags = {
    Creator = var.student_email
  }
}