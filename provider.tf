terraform {

  backend "local" {
  }
 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "16d873b7-07e2-482d-a0d7-d652b5d72e4a"
}