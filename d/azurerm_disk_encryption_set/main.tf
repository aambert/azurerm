terraform {
  required_providers {
    azurerm = ">= 2.0.0"
  }
}

data "azurerm_disk_encryption_set" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      read = timeouts.value["read"]
    }
  }

}

