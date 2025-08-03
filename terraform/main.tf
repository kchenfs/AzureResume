resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_app_environment" "env" {
  name                = "resume-env"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_container_app" "backend" {
  name                         = "resume-backend"
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.location

  template {
    container {
      name   = "backend"
      image  = var.container_image
      cpu    = 0.5
      memory = "1.0Gi"

      probes {
        type     = "liveness"
        path     = "/"
        port     = 8080
        interval = "30s"
      }
    }

    revision_mode = "Single"
  }

  ingress {
    external_enabled = true
    target_port      = 8080
  }
}
