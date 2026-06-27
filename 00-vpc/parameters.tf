resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  overwrite = true
}

resource "aws_ssm_parameter" "private_sub_ids" {
  name  = "/${var.project}/${var.environment}/private_ids"
  type  = "String"
  value = join("," ,module.vpc.private_ids)
  overwrite = true
}