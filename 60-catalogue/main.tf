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

#   depends_on = [
#   terraform_data.mongodb,
#   aws_route53_record.mongodb
# ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment} ${var.app_version}"
    ]
  }
}




resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.catalogue]

}

resource "aws_ami_from_instance" "catalogue" {
  name               = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [aws_ec2_instance_state.catalogue]

  tags = merge(
    {
        Name = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
    },
    local.common_tags
)
}



resource "aws_launch_template" "catalogue" {
  name = "${local.common_name}-catalogue"
  image_id = aws_ami_from_instance.catalogue.id

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"
   vpc_security_group_ids = [local.catalogue_sg_id]
   update_default_version = true

    tag_specifications {
    resource_type = "instance"

     tags = merge(
       {
          Name = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
       },
       local.common_tags

     )
  }
  
  
    tag_specifications {
    resource_type = "volume"

     tags = merge(
       {
          Name = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
       },
       local.common_tags

     )
  }


  tags = merge(
       {
          Name = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
       },
       local.common_tags
  )
}



resource "aws_lb_target_group" "catalogue" {
  name        = "${local.common_name}-catalogue"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = local.vpc_id
  target_type = "instance"
  deregistration_delay = "30"

  health_check {
    enabled             = true
    path                = "/health"
    protocol            = "HTTP"
    port                = "8080"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  lifecycle {
    create_before_destroy = true
  }
}
