output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_sub_ids" {
  value = module.vpc.public_sub_ids
}

output "private_sub_ids" {
  value = module.vpc.private_sub_ids
}

output "database_sub_ids"{
    value = module.vpc.database_sub_ids
}