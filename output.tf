output "vpc_id" {
  value = module.vpc.id
}

output "pub_sub_1_id" {
  value = module.subnets.public_subnet_1_id
}

output "pub_sub_2_id" {
  value = module.subnets.public_subnet_2_id
}

output "pri_sub_1_id" {
  value = module.subnets.private_subnet_1_id
}

output "pri_sub_2_id" {
  value = module.subnets.private_subnet_2_id
}

output "db_sub_1_id" {
  value = module.subnets.db_subnet_1_id
}

output "db_sub_2_id" {
  value = module.subnets.db_subnet_2_id
}
