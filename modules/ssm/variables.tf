variable "wazuh_private_ip" {
  type = string
}

variable "private_key" {
  type      = string
  sensitive = true
}
