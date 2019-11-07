resource "null_resource" "step1" {
  provisioner "local-exec" {
    command = "pip3 install --user datadog"
  }
}

resource "null_resource" "step2" {
  provisioner "local-exec" {
    command = "pip3 freeze"
  }
  depends_on = [ null_resource.step1 ]
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
