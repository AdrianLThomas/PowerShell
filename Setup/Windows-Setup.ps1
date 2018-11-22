Write-Host -ForegroundColor White "Adrian's PC Setup Script!"

#Manual step: Set-ExecutionPolicy Unrestricted

#Script Config
$ErrorActionPreference = "Stop"

#Apps to install
$installCommands = #BEGIN
'
                     # "Utils"
                      choco install -y avirafreeantivirus
                     ;choco install -y backblaze
                     ;choco install -y malwarebytes
                     ;choco install -y Firefox
                     ;choco install -y 7zip
                     ;choco install -y ccleaner
                     ;choco install -y speccy
                     ;choco install -y putty
                     ;choco install -y paint.net
                     ;choco install -y cpu-z
                     ;choco install -y treesizefree
                     ;choco install -y vmware-workstation-player
                     ;choco install -y speedfan
                     ;choco install -y dropbox

                     # "Audio/Video"
                     ;choco install -y foobar2000
                     ;choco install -y vlc
                     ;choco install -y spotify

                     # "Drivers"
                     ;choco install -y geforce-experience

                     # "Gaming"
                     ;choco install -y steam
                     ;choco install -y origin
                     ;choco install -y battle.net
                     ;Start-Process "http://support.logitech.com/software/gaming-software" #For the G27
                     ;choco install -y goggalaxy
                     ;Start-Process "https://www3.oculus.com/en-us/setup/"

'
#END

Write-Host "Press enter to begin or Ctrl+C to cancel"
Read-Host

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

foreach($command in $installCommands){
    Invoke-Expression $command
}

Write-Host -ForegroundColor Green "=== Setup Complete! ==="
