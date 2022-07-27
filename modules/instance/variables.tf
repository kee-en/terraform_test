variable "ami_data" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "bastion_tags" {
  type    = map(string)
  default = {}
}

