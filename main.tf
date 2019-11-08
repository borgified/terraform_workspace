resource "null_resource" "step1" {
  provisioner "local-exec" {
    command = "cd datadog-0.31.0 && python setup.py"
  }
}

resource "null_resource" "step2" {
  provisioner "local-exec" {
    command = "python -m datadog"
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
