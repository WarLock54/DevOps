resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
  tags                = var.tags
}
resource "azurerm_container_registry_task" "build_task" {
  name                  = "build_app"
  container_registry_id = azurerm_container_registry.acr.id
  platform { os = "Linux" }

  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = "https://github.com/WarLock54/DevOps#main:task08/application"
    context_access_token = var.git_pat
    image_names          = ["${var.image_name}:latest"]
  }
}

resource "azurerm_container_registry_task_schedule_run_now" "trigger" {
  container_registry_task_id = azurerm_container_registry_task.build_task.id
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