module "component" {
    for_each = var.components
  source = "git::https://https://github.com/Murutiswiggy/robo-component.git"
  environment = var.environment
  component = each.key
  app_version = each.value
} 