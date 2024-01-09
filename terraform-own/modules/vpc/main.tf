resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.prefix}-vpc}"
  }
}

data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_subnet" "my-subnet" {
    count = 2
    vpc_id            = aws_vpc.my-vpc.id
    cidr_block        = var.vpc_cidr_block
    availability_zone = data.aws_availability_zones.available.names[count.index]
}