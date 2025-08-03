terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateacct123"
    container_name       = "tfstate"
    key                  = "resumeapp.terraform.tfstate"
  }
}
