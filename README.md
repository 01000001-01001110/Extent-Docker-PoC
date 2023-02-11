# Extent-Docker-PoC


Docker Proof of Concept. 

Jenkins Pipeline is a powerful tool when you are using Jenkins to automate your deployments. Flexible and customized actions split between stages are a good reason to try this feature.

Building your own Docker Image and upload to Docker Hub to keep your repository updated is a good example to understand how Jenkins Pipelines can improve your way of work, that is the task of this PoC.

Prerequisites
A server with Jenkins and Docker running on it (Jenkins user should be allowed to run Docker).
Github account.
Docker hub account.
Setting up your environment
Install the Docker Pipelines plugin on Jenkins:

Manage Jenkins → Manage Plugins.
Search Docker Pipelines, click on Install without restart and wait until is done.
Upload your Dockerfile definition to your Github repository. 
Click on the green button Clone or Download and copy the URL as you will need it later.

On Jenkins you need to create a new credential with your Docker Hub account details. 
Go to Credentials → Global → Add credentials and fill out the form with your username and password. 
Fill in ID and Descriptions. Note that if you set the ID, you will need this specific ID to refer this credential from your scripts. 
Here we are just using dockerhub_id.


Now, we are ready to create our first Pipeline. On Jenkins go to  New Item → Pipeline, type the name you want for this Pipeline project and then click OK.

The Pipeline we are defining have four stages:

The first one is to get the Dockerfile from our Github repository,
The second one will build the image using $BUILD_NUMBER to tag the version,
The third one is pushing the built image to your Docker Hub registry.
Finally, we will cleanup the previously built image on the local server.
