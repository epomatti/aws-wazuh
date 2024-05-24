### AWS ###
variable "aws_region" {
  type    = string
  default = "us-east-2"
}

### Wazuh ###
variable "wazuh_ami" {
  type = string
}

variable "wazuh_instance_type" {
  type = string
}

### EC2 ###
variable "server_ami" {
  type = string
}

variable "server_instance_type" {
  type = string
}
