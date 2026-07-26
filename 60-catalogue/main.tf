resource "aws_instance" "catalogue" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.private_sub_id
  vpc_security_group_ids      = [local.catalogue_sg_id]
  associate_public_ip_address = true


tags = merge(
    {
        Name = "${local.common_name}-catalogue"
    },
    local.common_tags
)
}