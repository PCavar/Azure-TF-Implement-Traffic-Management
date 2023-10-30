# This command installs the Remote Access role on a Windows server.
Install-WindowsFeature RemoteAccess -IncludeManagementTools
# This command installs the Routing role service
Install-WindowsFeature -Name Routing -IncludeManagementTools -IncludeAllSubFeature
# This command installs the Remote Server Administration Tools (RSAT) for PowerShell
Install-WindowsFeature -Name "RSAT-RemoteAccess-Powershell"
# This command installs the Remote Access service with the Routing role service only
Install-RemoteAccess -VpnType RoutingOnly
# This command enables IP forwarding
Get-NetAdapter | Set-NetIPInterface -Forwarding Enabled
# Install webserver IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools