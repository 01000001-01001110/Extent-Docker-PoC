# Extent-Docker-PoC


Docker Proof of Concept. 

Jenkins Pipeline is a powerful tool when you are using Jenkins to automate your deployments. Flexible and customized actions split between stages are a good reason to try this feature. Building your own Docker Image and upload to Docker Hub to keep your repository updated is a good example to understand how Jenkins Pipelines can improve your way of work, that is the task of this PoC. In this I am working on a Docker image for Extent Hosting to use going forward. 

<h2>This installs </h2>
This repo builds a docker jenkins container
With the build it builds with docker installed on the container, as well as JQ which is vital going forward. 
I also removed the "initial" screen from the docker image.

<h2>The commands to run this are as follows:</h2>

<h2>Clone the repo:  </h2>
git clone https://github.com/01000001-01001110/Extent-Docker-PoC.git

<h2>Change the working directory: </h2>
cd Extent-Docker-PoC

<h2>Docker Build Command:</h2>
docker build --build-arg USER_GID=<###> --build-arg USER_ID=<###> -t extent-jenkins .
