variable "ami_data" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "network_interface_bastion" {
  type = string
}

variable "bastion_sg" {
  type = list
}

variable "public_subnet" {
  type = string
}

variable "bastion_tags" {
  type    = map(string)
  default = {}
}

