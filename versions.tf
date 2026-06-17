# Configure Terraform itself
terraform {
  required_version = "~> 1.15.0"
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
