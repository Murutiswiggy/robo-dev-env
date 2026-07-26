data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.project}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "private_sub_ids" {
   name = "/${var.project}/${var.environment}/private_sub_ids"
}