# Wazuh

Wazuh XDR and SIEM running on AWS with Linux and Windows servers.

## Deploy Wazuh

> [!TIP]
> Before applying the infrastructure, check and update the AMIs and cloud-init script installation versions.

Create the `.auto.tfvars` configuration:

```sh
cp config/template.tfvars .auto.tfvars
```

Create the infrastructure:

```sh
terraform init
terraform apply -auto-approve
```

Connect to Wazuh with the default credentials and confirm that the services are operational:

- Username: admin
- Password: Instance ID


## Deploy the servers

The configuration is prepared to install the agent and register the servers to Wazuh, following installation processes for [Linux][4] and [Windows][5] agents.

Set the variables to create the servers:

```terraform
enable_linux_server   = true
enable_windows_server = true
```

Update the infrastructure:

```sh
terraform apply -auto-approve
```

In case of isseus, check the agent [troubleshooting][2] help.

Follow Wazuh documentation to simulate threat scenarios, such as [credentials access attacks][1]. The configuration for Windows Server can be used from this [sysmonconfig.xml][3].


[1]: https://wazuh.com/blog/hunting-for-windows-credential-access-attacks/
[2]: https://documentation.wazuh.com/current/user-manual/agent/agent-enrollment/troubleshooting.html#testing-communication-with-the-wazuh-manager
[3]: https://wazuh.com/resources/blog/emulation-of-attack-techniques-and-detection-with-wazuh/sysmonconfig.xml
[4]: https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-linux.html
[5]: https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-windows.html
