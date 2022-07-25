variable "vpc_id" {
  type = string
}

variable "public_subnet_1_tags" {
  type    = map(string)
  default = {}
}

variable "public_subnet_2_tags" {
  type    = map(string)
  default = {}
}
  
variable "private_subnet_1_tags" {
  type    = map(string)
  default = {}
}

variable "private_subnet_2_tags" {
  type    = map(string)
  default = {}
}

variable "db_subnet_1_tags" {
  type    = map(string)
  default = {}
}

variable "db_subnet_2_tags" {
  type    = map(string)
  default = {}
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  type = string
}

variable "public_subnet_1_cidr_block" {
  type = string
}

variable "public_subnet_2_cidr_block" {
  type = string
}
  
variable "private_subnet_1_cidr_block" {
  type = string
}

variable "private_subnet_2_cidr_block" {
  type = string
}
  
variable "db_subnet_1_cidr_block" {
  type = string
}

variable "db_subnet_2_cidr_block" {
  type = string
}