# ----------------------
# TERRAFORM REQUIREMENTS
# ----------------------
terraform {
  # Terraform version
  required_version = ">= 1.4.0" # Not tested on Terraform version below 1.4.0, but will probably work.

  # Provider versions
  required_providers {
    azurerm = {
      version = ">= 3.50" # Not tested on provider version below 3.50, but will probably work.
    }
    azuread = {
      version = ">= 2.36" # Not tested on provider version below 2.36, but will probably work.
    }
  }

# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "terraform-rg"
    storage_account_name  = "terraformstatepoc2"
    container_name        = "apiops"
    key                   = "devapiops.terraform.tfstate"
  }  
}


# Terraform Provider Block for AzureRM
provider "azurerm" {
  features {
    # Updated as part of June2023 to delete "ContainerInsights Resources" when deleting the Resource Group
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
