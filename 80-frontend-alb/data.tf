data "aws_ssm_parameter" "frontend_alb_sg_id" {
  name = "/${var.project}/${var.environment}/frontend_alb_sg_id"
}

data "aws_ssm_parameter" "public_sub_ids" {
   name = "/${var.project}/${var.environment}/public_sub_ids"
}


data "aws_ssm_parameter" "certificate_arn" {
   name = "/${var.project}/${var.environment}/certificate_arn"
}
