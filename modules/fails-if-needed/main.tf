terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

variable "should_fail" {
  description = "Whether to intentionally fail the apply"
  type        = bool
  default     = false
}

resource "null_resource" "maybe_fail" {
  provisioner "local-exec" {
    command     = <<EOT
      if [ "${var.should_fail}" = "true" ]; then
        echo "Intentional failure triggered by should_fail = true"
        exit 1
      else
        echo "No failure, should_fail = false"
      fi
    EOT
    interpreter = ["/bin/sh", "-c"]
  }

  triggers = {
    always_run = timestamp()
  }
}

