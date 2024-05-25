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

module "ssm" {
  source           = "./modules/ssm"
  wazuh_private_ip = module.wazuh.instance_private_ip
}

module "linux_server" {
  count         = var.enable_linux_server ? 1 : 0
  source        = "./modules/servers/linux"
  vpc_id        = module.vpc.vpc_id
  subnet        = module.vpc.private_subnet_id
  ami           = var.linux_server_ami
  instance_type = var.linux_server_instance_type

  depends_on = [module.wazuh, module.ssm]
}

module "windows_server" {
  count         = var.enable_windows_server ? 1 : 0
  source        = "./modules/servers/windows"
  vpc_id        = module.vpc.vpc_id
  subnet        = module.vpc.public_subnet_id
  ami           = var.windows_server_ami
  instance_type = var.windows_server_instance_type
  public_key    = tls_private_key.generated_key.public_key_pem

  depends_on = [module.wazuh, module.ssm]
}
