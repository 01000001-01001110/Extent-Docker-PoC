# Extent-Docker-PoC


Docker Proof of Concept. 

Jenkins Pipeline is a powerful tool when you are using Jenkins to automate your deployments. Flexible and customized actions split between stages are a good reason to try this feature. Building your own Docker Image and upload to Docker Hub to keep your repository updated is a good example to understand how Jenkins Pipelines can improve your way of work, that is the task of this PoC. In this I am working on a Docker image for Extent Hosting to use going forward. 

<h2>This installs </h2>


<h2>The commands to run:</h2>
Clone the repo:  
git clone https://github.com/01000001-01001110/Extent-Docker-PoC.git

<h2>Change the working directory: </h2>
cd Extent-Docker-PoC

<h2>Docker Build Command.</h2>
docker build -t jenkins:jcasc --build-arg USER_GID=<###> --build-arg USER_ID=<###> -t extent-jenkins .
