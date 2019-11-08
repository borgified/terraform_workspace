resource "null_resource" "step1" {
  provisioner "local-exec" {
    command = "curl -sL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o jq && chmod u+x jq"
  }
}

resource "null_resource" "step2" {
  provisioner "local-exec" {
    command = "./jq --help"
  }
  depends_on = [ null_resource.step1 ]
}


module "dashboard" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.7"
  # insert the 3 required variables here
  api_key = var.api_key
  app_key = var.app_key
  prefix = var.prefix
  description = null_resource.step2.id
}

output "url" {
  value = module.dashboard.url
}
