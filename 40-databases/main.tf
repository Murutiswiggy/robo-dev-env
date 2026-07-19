resource "aws_instance" "mongodb" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.database_sub_id
  vpc_security_group_ids      = [local.mongodb_sg_id]
  associate_public_ip_address = true
#   user_data = templatefile("${path.module}/bastion.sh.tftpl",{
#          partition_number = 4
#          extend_size = 30
#   })

tags = merge(
    {
        Name = "${local.common_name}-mongodb"
    },
    local.common_tags
)
}


#provisioners
resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.mongodb.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo bash -x /tmp/bootstrap.sh mongodb dev"
    ]
  }
}




# resource "aws_instance" "redis" {
#   ami                         = data.aws_ami.redhat_ami.id
#   instance_type               = "t3.micro"
#   subnet_id                   = local.database_sub_id
#   vpc_security_group_ids      = [local.mongodb_sg_id]
#   associate_public_ip_address = true
# #   user_data = templatefile("${path.module}/bastion.sh.tftpl",{
# #          partition_number = 4
# #          extend_size = 30
# #   })



# tags = merge(
#     {
#         Name = "${local.common_name}-redis"
#     },
#     local.common_tags
# )
# }
