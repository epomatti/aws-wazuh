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
variable "enable_linux_server" {
  type = bool
}

variable "linux_server_ami" {
  type = string
}

variable "linux_server_instance_type" {
  type = string
}

variable "enable_windows_server" {
  type = bool
}

variable "windows_server_ami" {
  type = string
}

variable "windows_server_instance_type" {
  type = string
}
