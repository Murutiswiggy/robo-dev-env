module "sg" {
    source = "git::https://github.com/Murutiswiggy/robo-dev-sg.git?ref=main"
    project = var.project
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = var.sg_name
}