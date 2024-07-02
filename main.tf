provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = var.tenant_id
}

# Data source to get existing policy definition by name
data "azurerm_policy_definition" "example_policy" {
  display_name = var.policy_display_name
}

# Data source to get the Azure AD user principal ID
data "azuread_user" "example_user" {
  user_principal_name = var.user_principal_name
}

# Apply policy assignment
resource "azurerm_policy_assignment" "example_policy_assignment" {
  name                 = "example-policy-assignment"
  scope                = var.subscription_id
  policy_definition_id = data.azurerm_policy_definition.example_policy.id
}

# Assign role to principal (using the specified user)
resource "azurerm_role_assignment" "example_role_assignment" {
  scope                = var.subscription_id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_user.example_user.object_id
}

# Outputs
output "policy_definition_id" {
  value = data.azurerm_policy_definition.example_policy.id
}

output "principal_id" {
  value = data.azuread_user.example_user.object_id
}

output "assigned_policy_definition_id" {
  value = azurerm_policy_assignment.example_policy_assignment.policy_definition_id
}

output "role_assignment_principal_id" {
  value = azurerm_role_assignment.example_role_assignment.principal_id
}
