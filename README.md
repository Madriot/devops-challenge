# DevOps Challenge

This repository was created to complete a DevOps challenge. The challenge touches several key technologies commonly used in the DevOps industry today, including Terraform, Ansible, Kubernetes, Helm, Docker, Github Actions for CI/CD, and a cloud platform (in my case Azure).

#### Challenge Objectives

This challenge aims to accomplish the following goals:
- Backend Service: Develop a simple backend application that exposes an API endpoint /healthz, along with basic unic tests.
- Containerization: Create a Dockerfile to build a container image following best practices such as using a lightweight base image, multi-staged build and other optimizations if applicable.
- Kubernetes: Provision a Kubernetes cluster to the application. The cluster should be resilient and highly available, preferably multi-zonal (if applicable on free tier).
- Configuration Management: Use Ansible to configure the management virtual machine where all deployoments are executed.
- IaC: Use Terraform to deploy and manage the app infrastructure.
- CI/CD Pipelines: Implement Github Actions pipelines responsible for automating the deployment of both the application and infrastructure.
- Monitoring: Implement a basic monitoring system, preferable Grafana + Prometheus + kube-stats-metrics. Create a simple dashboard.

Throgout this challenge, the focus should be on idempotency, minimal manual intervention, and strong security practices across the entire infrastructure.