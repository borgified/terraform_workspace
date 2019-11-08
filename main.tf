module "dashboard" {
  source  = "borgified/dashboard/datadog"
  version = "0.1.8-beta"
  # insert the 3 required variables here
  api_key = var.api_key
  app_key = var.app_key
  prefix = var.prefix
}

output "url" {
  value = module.dashboard.url
}
