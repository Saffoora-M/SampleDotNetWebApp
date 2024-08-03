# .NET 8 Hello World

This sample demonstrates a tiny Hello World .NET Core app that is deployed using the concept of Docker

## Running in a Docker Container

The main Dockerfile in this repository is Dockerfile which builds and publishes a dotnetcore application and
then deploys it into the container.

I have utilized the concept of multi-stage Dockerfile thus reducing the size of the docker images and hence
speeding up the overall deployment time.

The Docker image is built on Linux OS

Next, from Azure portal I created a container instance from this ACR image and verified that it is working.

Following on from this, I created an app service from Azure Portal and deployed the image into the app service. I managed to create a web hook in the ACR so that as soon as new code is pushed into the ACR, it gets reflected in the App service thus reducing the time to refresh and improving productivity.

### Next steps

My next target is to automate the provisioning of the entire infrastructure in Azure through HashiCorp Terraform.



