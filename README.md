# AWS K8s Automation

This project demonstrates a **fully automated end-to-end deployment** of a containerized web application on **AWS EC2**, using modern **DevOps and Cloud-native technologies**.

The entire process — from infrastructure provisioning to application availability in the browser — is automated, with **no manual server login required**.

---

## 🚀 Technologies Used

- **AWS EC2** – Cloud infrastructure
- **Terraform** – Infrastructure as Code (IaC)
- **Ansible** – Configuration management & automation
- **Docker** – Containerization
- **Kubernetes (k3s)** – Container orchestration
- **WireGuard VPN** – Secure client-to-server connectivity
- **Flask (Python)** – Sample web application
- **Linux (Ubuntu)** – Server operating system

---

## 🧩 Architecture Overview

```text
Local Laptop
   |
   |  (WireGuard VPN)
   |
AWS EC2 (Ubuntu)
   ├── Docker
   ├── Kubernetes (k3s)
   └── Flask Application (Pod)
aws-k8s-automation/
├── infra/              # Terraform AWS infrastructure
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── ansible/            # Ansible automation
│   ├── site.yml
│   ├── roles/
│   │   ├── base/
│   │   ├── wireguard/
│   │   └── kubernetes/
│
├── k8s/                # Kubernetes manifests
│   ├── namespace.yml
│   ├── deployment.yml
│   └── service.yml
│
├── app/                # Flask application
│   ├── app.py
│   └── Dockerfile
│
├── scripts/
│   └── deploy.sh       # Full automation script
│
├── .gitignore
└── README.md


⚙️ What This Project Does

Provisions an AWS EC2 instance using Terraform

Automatically retrieves the public IP address

Updates the Ansible inventory dynamically

Configures the server (Docker, Kubernetes, networking)

Sets up WireGuard VPN for secure access

Builds and deploys a Flask application as a Docker container

Deploys the application to Kubernetes

Exposes the application via a Kubernetes Service

Makes the application accessible directly via browser
➡️ The entire workflow is executed automatically

