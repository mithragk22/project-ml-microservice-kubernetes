Build Status
--
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/mithragk22/project-ml-microservice-kubernetes/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/mithragk22/project-ml-microservice-kubernetes/tree/main)

## Project Overview

In this project, we will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

My project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create new Environment using cloud 9 
  - Instance type: t2.medium
  - Memory: 20 GB 
  - Install eksctl, kubectl

* Create Keypair and clone the github repos.
```
  ssh-keygen -t rsa
  cat /home/ec2-user/.ssh/id_rsa.pub
  Copy and add the SSH Key into github
  git clone git@github.com:mithragk22/project-ml-microservice-kubernetes.git
  cd project-ml-microservice-kubernetes/
```
    
* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv.
 ``` bash
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```
 
* Run `make install` to install the necessary dependencies
* Run `make lint` to lint the source code

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Steps for Docker Deployment

* Setup and Configure Docker locally
* Login docker
   ` docker login`
* Create Flask app in Container (Build the image and run)
    `./run_docker.sh`
* Upload docker image
    `./upload_docker.sh`
* Make a Prediction (open new terminal)
    `./make_prediction.sh`

### Steps for Kubernetes Deployment

* Setup and Configure Kubernetes locally
* Install Minikube 
    `curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/`
* Start a cluster using minukube
    `minikube start (or) minikube start --driver=docker `
* Verify cluster configurations kubectl config view - look for certificate authority and server
    `kubectl config view`
* Run via kubectl
    `./run_kubernetes.sh`
* Make a Prediction (open new terminal)
    `./make_prediction.sh`
    
### Delete Cluster
  `minikube delete`
  `minikube stop`
