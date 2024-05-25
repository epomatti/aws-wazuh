resource "aws_ssm_parameter" "wazuh_private_ip" {
  name  = "wazuh-private-ip"
  type  = "String"
  value = var.wazuh_private_ip
}

resource "aws_ssm_parameter" "private_key" {
  name  = "rds-private-key-pem"
  type  = "SecureString"
  value = var.private_key
}
