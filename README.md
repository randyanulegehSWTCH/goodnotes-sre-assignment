# Goodnotes SRE Take-Home Assignment

## Description
This repository contains the solution to the SRE take-home assignment for Goodnotes. The purpose of this assignment is to demonstrate how to manage and deploy an application in a Kubernetes cluster, simulate load traffic, and integrate the process into a CI/CD pipeline using GitHub Actions. The assignment requires the creation of a multi-node Kubernetes cluster, the deployment of a basic Ingress controller, and routing traffic to two services with different responses. Additionally, the solution incorporates automated load testing and reporting the results as a comment on a pull request.

The solution follows best practices in infrastructure automation, CI/CD integration, and Kubernetes management. Key technologies used include:
- Kubernetes (KinD - Kubernetes in Docker)
- Ingress controller (NGINX)
- GitHub Actions for CI/CD automation
- HTTP load testing using `hey`

## Key Features
- **Multi-node Kubernetes Cluster**: Provisioned using KinD with at least two nodes, running on localhost.
- **NGINX Ingress Controller**: Deployed to handle HTTP requests and route them to different services.
- **HTTP Echo Deployments**: Two simple HTTP echo deployments (`foo` and `bar`) that serve different responses (`"foo"` and `"bar"`, respectively).
- **Ingress Routing**: Traffic for `foo.localhost` and `bar.localhost` is routed to the corresponding HTTP echo deployment using Ingress.
- **Load Testing**: A randomized load testing script that generates traffic for both `foo.localhost` and `bar.localhost`.
- **CI/CD Automation**: The GitHub Actions workflow triggers the process of deploying the services, running the load test, and posting the results as a comment on the pull request.

## Instructions

### Prerequisites
Before you begin, ensure you have the following installed on your machine:
- **Docker Desktop**: Required for running KinD (Kubernetes in Docker).
- **KinD**: KinD allows you to create and manage Kubernetes clusters locally.
- **kubectl**: The Kubernetes command-line tool to interact with your cluster.
- **GitHub CLI**: Used to automate posting results to the GitHub Pull Request.

The fastest way to isnatll KinD, Kubectl , and GitHub Cli is by using brew.
brew install kubectl
brew install gh
brew install kind

once done double chekc installation by chekcing version. 

For Docker Desktop follow instructions from here : https://docs.docker.com/desktop/setup/install/mac-install/

### Setup
1. Clone this repository to your local machine.
2. Set up KinD by following the steps outlined above.
3. Ensure Docker and KinD are running.
4. Configure the GitHub Actions workflow by pushing a pull request to trigger the CI pipeline.

### Files Included
- `k8s/`: Contains Kubernetes deployment files for the foo and bar services.
- `ci/`: Contains the GitHub Actions workflow to trigger the CI pipeline.
- `scripts/`: Contains the load testing script.

### Load Test
The `load-test.sh` script runs a simple load test using the `hey` HTTP load testing tool. It tests the response time for both `foo.localhost` and `bar.localhost`.

### CI Workflow
The GitHub Actions workflow automatically triggers the deployment of the services, runs the load test, and posts the results as a comment on the PR.

### Considerations
- The load test uses `hey` to generate traffic for both services.
- The deployment is tested within a KinD Kubernetes cluster.
