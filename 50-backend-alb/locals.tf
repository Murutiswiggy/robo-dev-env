locals {
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  

    common_name = "${var.project}-${var.environment}"
    private_sub_ids = split("," , data.aws_ssm_parameter.private_sub_ids.value)
    common_tags = {
        project = "${var.project}"
        environment = "${var.environment}"
        terraform = true
    }
}

