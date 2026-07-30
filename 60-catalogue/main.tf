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


resource "terraform_data" "catalogue" {
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.rabbitmq.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment}"
    ]
  }
}




resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.catalogue]

}