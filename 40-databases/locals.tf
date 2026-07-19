locals {
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    # redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
    common_name = "${var.project}-${var.environment}"
    ami_id = data.aws_ami.redhat_ami.id
    database_sub_id = split("," , data.aws_ssm_parameter.database_sub_ids.value)[0]
    common_tags = {
        project = "${var.project}"
        environment = "${var.environment}"
        terraform = true
    }
}

