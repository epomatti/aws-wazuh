# Wazuh running on AWS

upgrade powershell
wazuh installer

admin
instance id

mkdir keys
ssh-keygen -f keys/temp_key

https://documentation.wazuh.com/current/user-manual/agent/agent-enrollment/troubleshooting.html#testing-communication-with-the-wazuh-manager

https://documentation.wazuh.com/current/user-manual/agent/agent-enrollment/security-options/using-password-authentication.html#password-authentication-linux-unix-endpoint


ssh-keygen -p -N "" -m pem -f temp_key


.\wazuh-agent-4.7.4-1.msi WAZUH_MANAGER="192.168.0.38"
NET START Wazuh



https://wazuh.com/blog/hunting-for-windows-credential-access-attacks/


https://wazuh.com/resources/blog/emulation-of-attack-techniques-and-detection-with-wazuh/sysmonconfig.xml
https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-linux.html
https://documentation.wazuh.com/current/installation-guide/wazuh-agent/wazuh-agent-package-windows.html
