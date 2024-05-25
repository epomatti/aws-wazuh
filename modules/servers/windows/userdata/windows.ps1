Set-TimeZone -Id "E. South America Standard Time"

Install-WindowsFeature Telnet-Client

# Avoids the progress bar from showing up
$ProgressPreference = 'SilentlyContinue'

# Install PowerShell
$psv="7.4.2"
$uri="https://github.com/PowerShell/PowerShell/releases/download/v${psv}/PowerShell-${psv}-win-x64.msi"
$path="ps7install.msi"
Invoke-WebRequest -URI $uri -OutFile $path
Start-Process msiexec "/i $path /quiet /qn /norestart" -Wait;

# Install AWS CLI
$awscli="https://awscli.amazonaws.com/AWSCLIV2.msi"
$awsclipath="AWSCLIV2.msi"
Invoke-WebRequest -URI $awscli -OutFile $awsclipath
Start-Process msiexec "/i $awsclipath /quiet /qn /norestart" -Wait;

# Install Wazuh Agent
$wuri="https://packages.wazuh.com/4.x/windows/wazuh-agent-4.7.4-1.msi"
$wpath="wazuhinstall.msi"
Invoke-WebRequest -URI $wuri -OutFile $wpath
$wazuhip = (aws ssm get-parameter --name "wazuh-private-ip" --query "Parameter.Value" --output text) | Out-String
$wazuhip = $wazuhip.trim()
Start-Process msiexec "/i $wpath /quiet /qn /norestart WAZUH_MANAGER=$wazuhip" -Wait;
NET START Wazuh