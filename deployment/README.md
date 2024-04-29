# Deploying the Developer Portal

## Steps to deploy
1. On your local system, run the 'build-and-save-image script'
```shell
cd ./deployment
```
(You only need the chmod step if you're on a Linux system and the script is not executable)
```shell
chmod +x build-and-save-image.sh
```
```shell
./build-and-save-image.sh
```
2. Upload the image tar file to the desired virtual machine, in its /var/tmp/ directory.
3. Open a shell on that machine, and run the 'deploy' script.
```shell
/usr/local/bin/deploy.sh
```
4. The Docker compose service will be recreated with a new dev-portal container using the updated image. 