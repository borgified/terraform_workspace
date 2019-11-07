variable dash_depends_on {
  default = null
  type = any
}

resource "null_resource" "prereq" {
  provisioner "local-exec" {
    command = "pip3 install datadog"
  }
  depends_on = [ var.dash_depends_on ]
}

module "dashboard" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.5"
  # insert the 3 required variables here
  api_key = var.api_key
  app_key = var.app_key
  prefix = var.prefix
  dash_depends_on = [ null_resource.prereq.id ]
}

output "url" {
  value = module.dashboard.url
}
