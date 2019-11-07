resource "null_resource" "prereq" {
  provisioner "local-exec" {
    command = "which pip3"
  }
}
resource "null_resource" "prereq1" {
  provisioner "local-exec" {
    command = "which pip"
  }
}
resource "null_resource" "prereq2" {
  provisioner "local-exec" {
    command = "pip install --user datadog"
  }
}

#module "dashboard" {
#  source  = "borgified/dashboard/datadog"
#  version = "0.1.5"
#  # insert the 3 required variables here
#  api_key = var.api_key
#  app_key = var.app_key
#  prefix = var.prefix
#  description = null_resource.prereq
#}

#output "url" {
#  value = module.dashboard.url
#}
