resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.public_subnet_id
  vpc_security_group_ids      = [local.bastion_sg_id]
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.bastion.name

  user_data = templatefile("${path.module}/bastion.sh.tftpl", {
    partition_number = 4
    extend_size      = 30
  })

 root_block_device {
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true

    tags = merge(
           {
        Name = "${local.common_name}-bastion"
    },
    local.common_tags
    )
  }


tags = merge(
    {
        Name = "${local.common_name}-bastion"
    },
    local.common_tags
)
}