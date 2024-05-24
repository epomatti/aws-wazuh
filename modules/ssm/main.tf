resource "aws_ssm_parameter" "wazuh_private_ip" {
  name  = "wazuh-private-ip"
  type  = "String"
  value = var.wazuh_private_ip
}
