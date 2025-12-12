resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "echo Hello from null_resource 1"
  }
}

module "dateprinter" {
  source  = "app.terraform.io/Terraform-Training-ISE/dateprinter"
  version = "0.2.0"
}

resource "null_resource" "example3" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo This always runs"
  }
  depends_on = [
    null_resource.example2
  ]
}
