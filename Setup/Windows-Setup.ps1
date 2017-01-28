Write-Host -ForegroundColor White "Adrian's PC Setup Script!"

#Manual step: Set-ExecutionPolicy Unrestricted

#Script Config
$ErrorActionPreference = "Stop"

#Apps to install
$installCommands = #BEGIN
'
                     # "Utils"
                      choco install -y avirafreeantivirus
                     ;choco install -y malwarebytes
                     ;choco install -y GoogleChrome
                     ;choco install -y 7zip
                     ;choco install -y btsync
                     ;choco install -y ccleaner
                     ;choco install -y imgburn
                     ;choco install -y speccy
                     ;choco install -y putty
                     ;choco install -y paint.net
                     ;choco install -y cpu-z
                     ;choco install -y everything
                     ;choco install -y f.lux
                     ;choco install -y tor-browser
                     ;choco install -y treesizefree
                     ;choco install -y truecrypt
                     ;choco install -y vuzeclient
                     ;choco install -y lastpass
                     ;Start-Process "https://soundswitch.codeplex.com/"

                     # "Audio/Video"
                     ;choco install -y foobar2000
                     ;choco install -y vlc
                     ;choco install -y spotify

                     # "Dev"
                     ;choco install -y visualstudiocode
                     ;choco install -y fiddler4
                     ;choco install -y sysinternals
                     ;choco install -y git.install

                     # "Drivers"
                     ;choco install -y geforce-experience

                     # "Gaming"
                     ;choco install -y steam -y
                     ;choco install -y origin -y
                     ;choco install -y battle.net -y
                     ;Start-Process "http://support.logitech.com/software/gaming-software" #For the G27
                     ;Start-Process "https://www.gog.com/galaxy"
                     ;Start-Process "https://www3.oculus.com/en-us/setup/"

                     # "Misc"
                     ;choco install -y Fitbit.Connect
                     ;choco install -y skype
'
#END

$manualInstalls = "Visual Studio (MSDN)",
                  "Microsoft Office (MSDN)"


Write-Host "Press enter to begin or Ctrl+C to cancel"
Read-Host

iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

foreach($command in $installCommands){
    Invoke-Expression $command
}

Write-Host -ForegroundColor Yellow "The following needs installing manually:"
foreach($installs in $manualInstalls){
    Write-Host -ForegroundColor Yellow "- " $installs
}

Write-Host "Installing customisations"
Write-Host "Customising command line colour palette"
git clone https://github.com/neilpa/cmd-colors-solarized %temp%\cmd-colors-solarized
regedit /s %temp%\cmd-colors-solarized\solarized-dark.reg

Write-Host -ForegroundColor Green "=== Setup Complete! ==="
