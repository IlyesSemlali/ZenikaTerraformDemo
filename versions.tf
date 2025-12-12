# Configure Terraform itself
terraform {
  backend "remote" {
    organization = "Terraform-Training-ISE"
    workspaces {
      name = "ZenikaTerraformDemo"
    }
  }

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}
