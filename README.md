# GitHub Actions Self Hosted Runner Autoscaling with Kubernetes

Welcome to the GitHub Actions Self Hosted Runner setup guide with Autoscaling on Kubernetes. This documentation will walk you through the steps to create a scalable and efficient GitHub Actions environment using Kubernetes.

## Table of Contents

1. [Create Namespace](#2-create-namespace)
2. [Create GitHub App](#3-create-github-app)
   1. [Create Secret on Kubernetes](#create-secret-on-kubernetes)
3. [Install Cert-Manager on Kubernetes](#install-cert-manager-on-kubernetes)
4. [Install actions-runner-controller](#install-actions-runner-controller)
5. [Create Multiple GitHub Actions Runners](#create-multiple-github-actions-runners)
6. [Autoscaling with Kubernetes](#autoscaling-with-kubernetes)
   1. [Deploy Horizontal Runner Autoscaler](#deploy-horizontal-runner-autoscaler)
7. [Conclusion](#conclusion)



## 1. Create Namespace

   $ kubectl create namespace action

## 2. Create GitHub App

that for authentecation with the github by it that created on github, that get the app_id,installation_id and private_key
for all of this value we can create a secret by terraform to make the authentication confidentiality.


## 3. Install Cert-Manager on Kubernetes

that a component ARC uses cert-manager for certificate managment of admimssion webhhok.

 $ helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.6.0 \
  --set prometheus.enabled=false \
  --set installCRDs=true

## 4. Install actions-runner-controller and secret.

Install actions-runner-controller
The secret and the action runner controller resouce that created by terraform file, that have a resouce by helm (actions_runner_controller) and all the details about the secret.
The values attribute within the helm_release block allows you to specify a list of values to be passed to 
the Helm chart during installation. These values are typically defined in a separate YAML file 
that contains configuration settings for the Helm chart.

   $ terraform init
   
   $ terraform apply


## 5. Create Multiple GitHub Actions Runners

that a custom resource defintion by ARC using for deploying github action runners on cluster.
Create k8s/runner-deployment.yaml

   $ kubectl apply -f k8s/runner-deployment.yaml
   $ kubectl get pods -n actions

## 6. Autoscaling with Kubernetes

that for automaticlly update a workload resouces such as the deployment scalling up and down
Deploy k8s/horizontal-runner-autoscaler.yaml

   $ kubectl apply -f k8s/horizontal-runner-autoscaler.yaml


## 7. Conclusion

Congratulations! You have successfully set up GitHub Actions Self Hosted Runners with Autoscaling on Kubernetes. I hope this guide has been helpful in optimizing your workflow.

Happy coding!
