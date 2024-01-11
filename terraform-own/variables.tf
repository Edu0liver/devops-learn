variable "prefix" {
  type    = string
  default = "my"
}

variable "vpc_cidr_block" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = ""
}
