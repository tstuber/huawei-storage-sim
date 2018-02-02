# This powershell script demonstrates how Huawei Storage can be managed via REST. 
# Instead of testing automatisation torwards productive storage systems, this approch 
# can be helpful to test upfront against a simulation. 
# 
# Preconditions:
#  - Install Huawei Demo Simulator
#     Source: http://support.huawei.com/enterprise/en/tool/storage-simulator-TL1000000114/TV1000000063
#  - Get the official API to see what commands can be used. 
#  - Start Simulator and Create Pool 
#
# Thomas Stuber, 02.02.2018 


# Accecpt self-signed certificate. 
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true} ;


# Define 
$storageSerial = "1016964156"
$user = "admin"
$pass = "Admin@storage"
$url = "https://localhost:8088/deviceManager/rest/$storageSerial"


# Connect to Storage and get iBaseToken from Session. 
$body = @{ "username" = $user; "password" = $pass; "scope"="0" } | ConvertTo-Json
$auth = Invoke-WebRequest -Uri $url/sessions -Method POST -Body $body -SessionVariable session
$iBaseToken = $auth | ConvertFrom-Json | select -expand data | select iBaseToken
$header = @{ "iBaseToken"=$iBaseToken.iBaseToken }

# Check if LUN exists.
$lunCount = Invoke-WebRequest -Uri $url/lun/count -Method GET -WebSession $session -Headers $header
$lunCount = ($lunCount.Content | ConvertFrom-Json).data.Count

echo "Amount of LUNs existing: $lunCount"

# Disconnect
Invoke-WebRequest -Uri $url/sessions -Method DELETE -WebSession $session -Headers $header
