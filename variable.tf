data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "DCODNext" {
}

variable "environmentKey" {
  type        = string
  default     = "DevAKS"
  description = "Optional Input - Value to describe the environment. Used for tagging. (Default: DevAKS)"
}

#variable "azurerm_management_group" {
#  type        = string
#  description = "The name of the management group where role should be assigned."
#}

variable "azurerm_management_group" {
  type = map(object({
    id    = string
    name  = string
  }))
  description = "The name of the management group where role should be assigned."
}
