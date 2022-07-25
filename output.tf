output "vpc_id" {
  value = module.vpc.id
}

output "pub_sub_1_id" {
  value = module.subnets.public_subnet_1_id
}