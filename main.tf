terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.51.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  workload          = "wazuh"
  availability_zone = "${var.aws_region}a"
}

### General ###
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

### VPC ###
module "vpc" {
  source            = "./modules/vpc"
  region            = var.aws_region
  workload          = local.workload
  availability_zone = local.availability_zone
}

### EC2 ###
module "wazuh" {
  source        = "./modules/wazuh"
  vpc_id        = module.vpc.vpc_id
  subnet        = module.vpc.public_subnet_id
  ami           = var.wazuh_ami
  instance_type = var.wazuh_instance_type
}

module "server" {
  source        = "./modules/server"
  vpc_id        = module.vpc.vpc_id
  subnet        = module.vpc.private_subnet_id
  ami           = var.server_ami
  instance_type = var.server_instance_type
}
