locals {
  frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
  certificate_arn = data.aws_ssm_parameter.certificate_arn.value

    common_name = "${var.project}-${var.environment}"
   public_sub_ids = split("," , data.aws_ssm_parameter.public_sub_ids.value)
    common_tags = {
        project = "${var.project}"
        environment = "${var.environment}"
        terraform = true
    }
}

