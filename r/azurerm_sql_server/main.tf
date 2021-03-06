terraform {
  required_providers {
    azurerm = ">= 2.0.0"
  }
}

resource "azurerm_sql_server" "this" {
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  location                     = var.location
  name                         = var.name
  resource_group_name          = var.resource_group_name
  tags                         = var.tags
  version                      = var.version

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value["type"]
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      create = timeouts.value["create"]
      delete = timeouts.value["delete"]
      read   = timeouts.value["read"]
      update = timeouts.value["update"]
    }
  }

}

