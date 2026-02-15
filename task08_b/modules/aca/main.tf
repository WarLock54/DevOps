resource "azurerm_user_assigned_identity" "aca_identity" {
  name                = "${var.name}-identity"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_key_vault_access_policy" "aca_kv_policy" {
  key_vault_id       = var.keyvault_id
  tenant_id          = azurerm_user_assigned_identity.aca_identity.tenant_id
  object_id          = azurerm_user_assigned_identity.aca_identity.principal_id
  secret_permissions = ["Get", "List", "Set", "Delete", "Purge"]
}

resource "azurerm_role_assignment" "aca_acr_pull" {
  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_user_assigned_identity.aca_identity.principal_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_app_environment" "main" {
  name                       = var.aca_env_name
  location                   = var.location
  resource_group_name        = var.rg_name
  log_analytics_workspace_id = null # Opsiyonel, ancak environment için gerekli
  workload_profile {
    name                  = "Consumption"
    workload_profile_type = var.workload_profile_type
  }
  tags = var.tags
}

resource "azurerm_container_app" "app" {
  name                         = var.name
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = var.rg_name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aca_identity.id]
  }

  registry {
    server   = var.acr_login_server
    identity = azurerm_user_assigned_identity.aca_identity.id
  }

  secret {
    name                = "redis-url"
    key_vault_secret_id = var.kv_redis_host_url
    identity            = azurerm_user_assigned_identity.aca_identity.id
  }

  secret {
    name                = "redis-key"
    key_vault_secret_id = var.kv_redis_password_url
    identity            = azurerm_user_assigned_identity.aca_identity.id
  }

  template {
    container {
      name   = "python-app"
      image  = "${var.acr_login_server}/${var.image_name}:latest"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name  = "CREATOR"
        value = "ACA"
      }
      env {
        name  = "REDIS_PORT"
        value = "6379"
      }
      env {
        name        = "REDIS_URL"
        secret_name = "redis-url"
      }
      env {
        name        = "REDIS_PWD"
        secret_name = "redis-key"
      }
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  tags = var.tags

  depends_on = [azurerm_key_vault_access_policy.aca_kv_policy]
}