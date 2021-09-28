Write-Host "Build Start"
docker build -t spigot_build .
Write-Host "Run Start"
docker run -d -v /d/Minecraft/docker/bind:/usr/bind spigot_build
Write-Host "Run End"