#!/bin/bash
echo "🚀 Starting full automated deployment..."

PROJECT_DER=$(pwd)
INFRA_DER="$PROJECT_DER/infra"
ANSIBLE_DER="$PROJECT_DER/ansible"
INVENTORY_FILE="$ANSIBLE_DER/inventory"
KEY_PATH="$INFRA_DER/EC2.pem"

# Terraform Apply
echo "📦 Running Terraform..."
cd "$INFRA_DER"

terraform init -input=false
terraform apply -auto-approve


SERVER_IP=$(terraform output -raw public_ip)
echo "🌍 Server Public IP: $SERVER_IP"
echo "📝 Updating Ansible inventory..."
cat > "$INVENTORY_FILE" << EOF
[server]
$SERVER_IP ansible_user=ubuntu ansible_ssh_private_key_file=$KEY_PATH ansible_python_interpreter=/usr/bin/python3 ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "⏳ Waiting for SSH to become available..."
sleep 80

echo "Running Ansible playbook..."

cd "$ANSIBLE_DER"
ansible-playbook -i inventory site.yml

echo "✅ Deployment completed successfully!"
echo "🌐 Open your application at:"
echo "👉 http://$SERVER_IP:8080"
