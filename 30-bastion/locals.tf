locals {
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    common_name = "${var.project}-${var.environment}"
    ami_id = data.aws_ami.redhat_ami.id
    public_subnet_id = split("," , data.aws_ssm_parameter.public_sub_ids.value)[0]
    common_tags = {
        project = "${var.project}"
        environment = "${var.environment}"
        terraform = true
    }
}