Write-Host -ForegroundColor White "Adrian's PC Setup Script!"

#Manual step: Set-ExecutionPolicy Unrestricted

#Script Config
$ErrorActionPreference = "Stop"

#Apps to install
$installCommands = #BEGIN
'
                     # "Utils"
                     ;choco install -y backblaze
                     ;choco install -y malwarebytes
                     ;choco install -y Firefox
                     ;choco install -y 7zip
                     ;choco install -y ccleaner
                     ;choco install -y speccy
                     ;choco install -y putty
                     ;choco install -y paint.net
                     ;choco install -y cpu-z
                     ;choco install -y speedfan
                     ;choco install -y treesizefree
                     ;choco install -y dropbox
                     ;choco install -y nordvpn
                     ;choco install -y qbittorrent
                     ;choco install -y docker-desktop

                     # "Audio/Video"
                     ;choco install -y foobar2000
                     ;choco install -y vlc
                     ;choco install -y spotify

                     # "Dev"
                     ;choco install -y vscode
                     ;dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
                     ;Start-Process "https://docs.microsoft.com/en-us/windows/wsl/install-win10"
                     ;Start-Process "https://github.com/ohmyzsh/ohmyzsh" # ZSH_THEME="fino-time"

                     # "Drivers"
                     ;choco install -y geforce-experience

                     # Create gaming account
                     ;New-LocalUser -Name "Gaming" -Description "Gaming account" -NoPassword

                     # "Gaming"
                     ;choco install -y steam
                     ;choco install -y origin
                     ;choco install -y battle.net
                     ;choco install -y epicgameslauncher
                     ;choco install -y filezilla
                     ;choco install -y goggalaxy
                     ;Start-Process "http://support.logitech.com/software/gaming-software" #For the G27
                     ;Start-Process "https://www3.oculus.com/en-us/setup/"

'
#END

Write-Host "Press enter to begin or Ctrl+C to cancel"
Read-Host

foreach($command in $installCommands){
    Invoke-Expression $command
}

Write-Host -ForegroundColor Green "=== Setup Complete! ==="
