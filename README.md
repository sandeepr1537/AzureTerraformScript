# AzureTerraformScript
This Terraform script  connects to Azure, retrieves an existing policy definition and the principal ID, and then uses them, you can structure the script into three separate files (main.tf, variables.tf, and terraform.tfvars). This script will include the necessary data sources to fetch the existing policy definition and the principal ID.


main.tf:
Contains the main Terraform configuration, including providers, data sources, resources, and outputs.
Retrieves the existing policy definition by its display name and the Azure AD user principal ID.
Applies the policy assignment and role assignment using the retrieved IDs.


variables.tf:
Declares the variables used in the Terraform configuration, including the tenant ID, user principal name, subscription ID, and policy display name.


terraform.tfvars:
Sets the values for the variables declared in variables.tf.
Replace "your-tenant-id", "user@domain.com", "your-subscription-id", and "Existing Policy Display Name" with your actual values.
