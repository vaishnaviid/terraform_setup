# Terraform Setup on Amazon Linux EC2

This guide explains how to set up Terraform on an Amazon Linux EC2 instance along with helpful VS Code extensions and prerequisites.

---

## 1. Launch an EC2 Instance
- **OS:** Amazon Linux 2  
- **Instance type:** t2.micro (Free Tier)  
- **Security Group:** Allow SSH (port 22)

SSH into the EC2 instance:

```bash
ssh -i your-key.pem ec2-user@your-ec2-ip
2. Install Terraform on Amazon Linux 2
```bash
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install -y terraform
```
Verify installation:

``` bash
terraform --version
```
3. Install Git (optional)
``` bash
sudo yum install -y git
```
4. Recommended VS Code Extensions for Terraform
Extension Name	Purpose
HashiCorp Terraform	Syntax highlighting, linting, IntelliSense
Prettier	Auto-format JSON
YAML (RedHat)	YAML validation for CI/CD

Install from VS Code marketplace → Extensions → Search.

5. Terraform Project Structure Example
 ``` bash
my-terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
└── provider.tf
```
7. Initialize Terraform
``` bash
terraform init
```
8. Format & Validate
``` bash
terraform fmt
terraform validate
```
9. Terraform Workflow Basics
``` bash
terraform plan
terraform apply
terraform destroy
```
10. Optional: Configure AWS CLI
``` bash
sudo yum install -y awscli
aws configure
Enter:

AWS Access Key ID

AWS Secret Access Key

Default region
```

