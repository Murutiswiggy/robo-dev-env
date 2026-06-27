module "vpc" {
  source = "git::https://github.com/Murutiswiggy/robo-infra.git?ref=main"
  project = "roboshop"
  environment = "dev"
  peering_required = false

}

  