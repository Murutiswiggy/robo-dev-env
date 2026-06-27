module "vpc" {
  source = "git::https://github.com/Murutiswiggy/robo-infra.git?ref=main"
  project = var.project
  environment = var.environment
  peering_required = false

}

  