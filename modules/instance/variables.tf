variable "ami_data" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "network_interface_bastion" {
  type = string
}

variable "bastion_tags" {
  type    = map(string)
  default = {}
}

