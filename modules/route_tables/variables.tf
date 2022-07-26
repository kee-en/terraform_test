variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "ngw_id" {
  type = string
}

variable "public_rt_tags" {
  type    = map(string)
  default = {}
}

variable "private_rt_tags" {
  type = map(string)
  default = {}
}

variable "db_rt_tags" {
  type = map(string)
  default = {}
}

variable "public_rt_cidr_block" {
  type = string
}

variable "private_rt_cidr_block" {
  type = string
}
