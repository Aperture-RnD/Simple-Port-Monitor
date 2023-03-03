#What is my purpose?
#You watch a port.
#Oh. My. God.

$File = "C:\ScriptOutput\PortWatcherOutput.txt"
$Port = Read-Host "What port number?"
$Folder = "C:\ScriptOutput"
If(!(Test-Path -PathType Container $Folder))
{
      New-Item -ItemType Directory -Path $Folder | Out-Null
}
echo "PROGRAM STARTUP: You have chosen to watch port $Port" >> $File
echo "PROGRAM STARTUP: Please check C:\ScriptOutput\PortWatcherOutput.txt when monitoring is finished."
echo "You have chosen to watch port $Port"

while (1){
sleep 5
$timestamp = Get-Date
echo $timestamp >> $File
netstat -an | findstr $Port >> $File
echo "Complete loop. If there's no output, there's no connection." >> $File
echo "--------------------------" >> $File
echo "I'm still alive if the timestamp is changing every 5 seconds. Please don't close me!"
}