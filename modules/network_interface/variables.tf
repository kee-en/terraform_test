variable "public_subnet" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
