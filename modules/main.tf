terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "print_date" {
  provisioner "local-exec" {
    command = "date"
  }

  triggers = {
    always_run = timestamp()
  }
}


module "dateprinter" {
  source  = "app.terraform.io/Terraform-Training-ISE/dateprinter/IlyesSemlali"
  version = "0.1.0"
}
