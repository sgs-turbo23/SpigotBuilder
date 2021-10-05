$cd = Convert-Path .
Write-Host "Build Start"
docker build -t spigot_build .
Write-Host "Run Start"
docker run -it --mount type=bind,source=$cd,target=/bind spigot_build
Write-Host "Run End"