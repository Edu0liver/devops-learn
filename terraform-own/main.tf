terraform {
    required_version = ">= 0.13.0"
    
    required_providers {
        local = ">=2.4.1"
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWGR2CV47I3D6BN4F"
  secret_key = "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"
}

module "my-vpc" {
    source = "./modules/vpc"
    prefix = var.prefix
    vpc_cidr_block = var.vpc_cidr_block
}