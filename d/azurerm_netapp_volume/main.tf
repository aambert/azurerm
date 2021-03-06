terraform {
  required_providers {
    azurerm = ">= 2.0.0"
  }
}

data "azurerm_netapp_volume" "this" {
  account_name        = var.account_name
  name                = var.name
  pool_name           = var.pool_name
  resource_group_name = var.resource_group_name

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      read = timeouts.value["read"]
    }
  }

}

