locals {
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  ami_id = data.aws_ami.redhat_ami.id

    common_name = "${var.project}-${var.environment}"
    private_sub_id = split("," , data.aws_ssm_parameter.private_sub_ids.value)[0]
    common_tags = {
        project = "${var.project}"
        environment = "${var.environment}"
        terraform = true
    }
}
