resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "echo Hello from null_resource 1"
  }
}

resource "null_resource" "example2" {
  provisioner "local-exec" {
    command = "echo Hello from null_resource 2"
  }

  depends_on = [
    null_resource.example1
  ]
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

