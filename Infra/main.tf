terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.114.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}

resource "azurerm_resource_group" "learnRG" {
  name     = "demo-rg"
  location = "East US"
}

resource "azurerm_container_registry" "learnACR" {
  name                = "demomyACR2024"
  resource_group_name = azurerm_resource_group.learnRG.name
  location            = azurerm_resource_group.learnRG.location
  sku                 = "Premium"
  admin_enabled       = true

}

resource "azurerm_service_plan" "learnASP" {
  name                = "my-asp"
  location            = azurerm_resource_group.learnRG.location
  resource_group_name = azurerm_resource_group.learnRG.name
  os_type             = "Linux"
  sku_name            = "S1"

}

resource "azurerm_linux_web_app" "learnAS" {
  name                = "myappservicesn2024"
  resource_group_name = azurerm_resource_group.learnRG.name
  location            = azurerm_resource_group.learnRG.location
  service_plan_id     = azurerm_service_plan.learnASP.id
  app_settings = {
    WEBSITES_PORT = 8080
  }
  
  
  site_config {
    application_stack {
      docker_image_name        = "mydotnetproj:4"
      docker_registry_password = azurerm_container_registry.learnACR.admin_password
      docker_registry_url      = "https://${azurerm_container_registry.learnACR.login_server}"
      docker_registry_username = azurerm_container_registry.learnACR.name

    }
  }
}

