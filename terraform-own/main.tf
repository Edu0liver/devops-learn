terraform {
  required_version = ">= 0.13.0"

  required_providers {
    local = ">=2.4.1"
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "first-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWGR2CV47I3D6BN4F"
  secret_key = "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"
}

module "my-vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "my-ec2" {
  source        = "./modules/ec2"
  prefix        = var.prefix
  instance_type = var.instance_type
  vpc_id        = module.my-vpc.vpc_id
  subnet_id     = module.my-vpc.subnet_ids[0]
  key_name      = var.key_name
}
