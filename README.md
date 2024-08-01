# .NET 8 Hello World

This sample demonstrates a tiny Hello World .NET Core app that is deployed using the concept of Docker

## Running in a Docker Container

The main Dockerfile in this repository is Dockerfile which builds and publishes a dotnetcore application and
then deploys it into the container.

I have utilized the concept of multi-stage Dockerfile thus reducing the size of the docker images and hence
speeding up the overall deployment time.

The Docker image is built on Linux OS

### Next steps

I would next deploy my application into an Azure Container Registry



