resource "null_resource" "prereq" {
  provisioner "local-exec" {
    command = "pip3 install datadog"
  }
}

module "dashboard" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.5"
  # insert the 3 required variables here
  api_key = var.api_key
  app_key = var.app_key
  prefix = var.prefix
  depends_on = [ null_resource.prereq ]
}

output "url" {
  value = module.dashboard.url
}
