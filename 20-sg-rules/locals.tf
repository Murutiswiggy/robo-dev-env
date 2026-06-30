locals {

    mongodb_sg_id = aws_ssm_parameter.mongodb_sg_id.value
    catalogue_sg_id = aws_ssm_parameter.catalogue_sg_id.value 
}