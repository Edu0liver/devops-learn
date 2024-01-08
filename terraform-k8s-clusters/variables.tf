variable "prefix" {
    type = string
    default = "my"
}

variable "cluster_name" {
    type = string
    default = "cluster"
}

variable "retention_days" {
    type = number
    default = 7
}

variable "desired_size" {
    type = number
    default = 1
}

variable "max_size" {
    type = number
    default = 1
}

variable "min_size" {
    type = number
    default = 1
}

variable "vpc_cidr_block" {
    type = string
    default = ""
}
