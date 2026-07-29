resource "aws_instance" "mongodb" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.database_sub_id
  vpc_security_group_ids      = [local.mongodb_sg_id]
  associate_public_ip_address = true


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
      "sudo bash /tmp/bootstrap.sh mongodb ${var.environment}"
    ]
  }
}



#redis
resource "aws_instance" "redis" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.database_sub_id
  vpc_security_group_ids      = [local.redis_sg_id]
  associate_public_ip_address = true


tags = merge(
    {
        Name = "${local.common_name}-redis"
    },
    local.common_tags
)
}


#provisioners
resource "terraform_data" "redis" {
  triggers_replace = [
    aws_instance.redis.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.redis.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo bash /tmp/bootstrap.sh redis ${var.environment}"
    ]
  }
}


#rabbitmq
resource "aws_instance" "rabbitmq" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.database_sub_id
  vpc_security_group_ids      = [local.rabbitmq_sg_id]
  associate_public_ip_address = true


tags = merge(
    {
        Name = "${local.common_name}-rabbitmq"
    },
    local.common_tags
)
}


#provisioners
resource "terraform_data" "rabbitmq" {
  triggers_replace = [
    aws_instance.rabbitmq.id
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
      "sudo sh /tmp/bootstrap.sh rabbitmq ${var.environment}"
    ]
  }
}


#MySQL
resource "aws_instance" "mysql" {
  ami                         = data.aws_ami.redhat_ami.id
  instance_type               = "t3.micro"
  subnet_id                   = local.database_sub_id
  vpc_security_group_ids      = [local.mysql_sg_id]
  associate_public_ip_address = true
iam_instance_profile = aws_iam_instance_profile.mysql_profile.name

tags = merge(
    {
        Name = "${local.common_name}-mysql"
    },
    local.common_tags
)
}


#provisioners
resource "terraform_data" "mysql" {
  triggers_replace = [
    aws_instance.mysql.id
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.mysql.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql ${var.environment}"
    ]
  }
}


# provisioner "remote-exec" {
#   inline = [
#     "cd /home/ec2-user/robo-ansible-v3",
#     "ansible-playbook mysql.yaml -e env=${var.environment}"
#   ]
# }

# }