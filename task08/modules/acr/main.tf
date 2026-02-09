resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = true
  tags                = var.tags
}
resource "azurerm_container_registry_task" "build_task" {
  count                 = 1
  name                  = "build_app"
  container_registry_id = azurerm_container_registry.acr.id
  platform {
    os = "Linux"
  }

  docker_step {
    dockerfile_path      = "task08/application/Dockerfile"
    context_path         = "https://github.com/WarLock54/DevOps"
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:latest"]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "trigger" {
  count                      = 1
  container_registry_task_id = azurerm_container_registry_task.build_task[0].id
}
/*
resource "azurerm_container_registry_task" "build_task" {
  name                  = "build_app"
  container_registry_id = azurerm_container_registry.acr.id
  platform { os = "Linux" }

  docker_step {
    dockerfile_path      = "task08/application/Dockerfile"
    context_path         = "https://github.com/user/repo#main" # Örnek repo yolu
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:latest"]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "trigger" {
  container_registry_task_id = azurerm_container_registry_task.build_task.id
}*/