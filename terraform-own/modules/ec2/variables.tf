variable "prefix" {
  type    = string
  default = "my"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}
