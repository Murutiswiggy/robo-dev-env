resource "aws_ssm_parameter" "sg_id_secret" {
  name  = "/${var.project}/${var.environment}/mysql_root_password"
  type  = "securestring"
  value = var.mysql_root_password
  overwrite = true

}
