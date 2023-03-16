terraform {

  required_providers {

    azurerm = {

      source  = "hashicorp/azurerm"

      version = "3.44.1"

    }

  }

}
provider "azurerm" {
  features {}  
}

resource "azurerm_role_definition" "DCODNextReader" {
  role_definition_id = "00000000-0000-0000-0000-000000000000"
  name               = "DCODNext_Reader"
  scope              = data.azurerm_subscription.primary.id
  description        = "Users with rights to Read all resources"

  permissions {
    actions          = [
        "*/read"
    ]
    data_actions     = []
    not_actions      = []
    not_data_actions = []
  }

  assignable_scopes  = [
    data.azurerm_subscription.primary.id,
  ]
}

resource "azurerm_role_assignment" "DCODNextReader" {
  name               = "00000000-0000-0000-0000-000000000000"
  scope              = var.azurerm_management_group.primary.id
  role_definition_id = azurerm_role_definition.DCODNextReader.role_definition_resource_id
  principal_id       = data.azurerm_client_config.DCODNext.object_id
}
