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

**📁 Project Structure**
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
├── kube/                # Kubernetes manifests
│   ├── deployment.yml
│   └── service.yml
│
│
├── deploy.sh       # Full automation script
│
├── .gitignore
└── README.md

⚙️ What This Project Does

Provisions an AWS EC2 instance using Terraform
Automatically retrieves the EC2 public IP
Updates Ansible inventory dynamically
Configures the server (Docker, Kubernetes, networking)
Sets up WireGuard VPN for secure access
Builds and containerizes a Flask application
Deploys the application to Kubernetes
Exposes the application via a Kubernetes Service
Makes the application accessible directly via browser
➡️ The entire workflow is fully automated

▶️ How to Run
Prerequisites

AWS account
AWS credentials configured
Terraform installed
Ansible installed
SSH key pair for EC2
Linux-based system (recommended)

🚀 One-command Deployment
bash deploy.sh

After successful deployment, open your browser:

http://<EC2_PUBLIC_IP>:8080



