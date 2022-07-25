variable "tags" {
  type    = map(string)
  default = {}
}

variable "cidr_block" {
  type = string
  default = "10.50.0.0/16"
}
