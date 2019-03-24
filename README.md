This is a simple docker container for Mojang's bedrock server software.

The startup script will download and unpack the server software from Mojang's site.  Update the link in the `docker-compose.yml` file to get the latest version.

Copy the `server.properties.default` file to `server.properties` and edit it to your preferences.  You can put an existing Bedrock world file in the data/worlds folder and point to it using the `level-name=` setting in the server.properties file.

# Build
Build the docker image first.  Change to the directory containing the Dockerfile and run:
```
./build.sh
```
The script downloads the zip file from Microsoft and extracts it into an image.

# docker run
```
docker run -p 19132:19132/udp -d --rm --name bedrock 192.168.0.114:30500/minecraft/bedrock_server:1.9.0.15
```

# docker-compose
```
docker-compose up -d
```
# Kubernetes

Create PV & PVC:
```
kubectl create -f pv.yaml
```

Create the Deployment & Service:
```
kubectl create -f bedrock.yaml
```

