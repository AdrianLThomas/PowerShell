# Finds the best VPN to connect to
param(
    $capacityLimitPercentage = 5,
    $minLong = -35.0,
    $maxLong = 27 
)

$xml = wget https://account.ipvanish.com/serverList.xml
$doc = [xml]$xml.content
$serverList = $doc.serverList.server.name

# Get all servers within capacity
$serverList = $doc.serverList.server | 
              where {#$_.capacity -lt $capacityLimitPercentage -and
                     $_.status -eq 1 -and
                     $_.visible -eq 1 -and
                     $minLong -lt $_.lng -and
                     $maxLong -gt $_.lng
                     } 
               

# Ping all found servers and find fastest   
$serverResponses = @()
foreach ($server in $serverList){  
	$ping = (Test-Connection -ComputerName $server.name -Count 4 | measure-Object -Property ResponseTime -Average).average
	$response = ($ping -as [int])	
    
    $serverResponse = New-Object PSObject
    $serverResponse | Add-Member -Type NoteProperty -Name Name -Value $server.name
    $serverResponse | Add-Member -Type NoteProperty -Name ResponseTime -Value $response
    $serverResponses += $serverResponse
}

$serverResponses | Sort-Object -Property ResponseTime


