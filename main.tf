module "dev" {
  source = "../modules/robo"
  project = "roboshop"
  environment = "dev"
  peering_required = false
  
}