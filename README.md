# AWS Web Hosting Infrastructure with Terraform


This project builds a production-ready web hosting infrastructure on AWS using Terraform, with a modular and reusable architecture.

## Project Goal


You will build a fully functional and production-like web hosting infrastructure on AWS using Terraform:

- A custom VPC with public subnets (in different AZ's)
- 
- A public Application Load Balancer (ALB)
- 
- An Auto Scaling Group (ASG) of EC2 instances (with NGINX installed)
- 
- Security groups with best-practice rules
- 
- Terraform modules for VPC, ALB, EC2, and Security Groups
- 
- Remote state storage using S3


## Before You Start


To use this infrastructure, follow these steps:

### Step 1: Clone the Repository


git clone https://github.com/mkotonoyan25/terraform-scalable-web.git

cd terraform-scalable-web/envs/dev

### Step 2: Review and Update Module Variables


Go to each module folder under modules/ (e.g., modules/vpc, modules/ec2, etc.)

Open the variables.tf file inside each module

You can change the default values or use them as-is

### Step 3. Optional: Update Common Tags


- You can customize the common_tags in envs/dev/variables.tf
  
### Step 4. Provide Your AWS Credentials


- In envs/dev/, create a file named terraform.tfvars (if it doesn’t exist)
- Or directly edit envs/dev/variables.tf
- Add your AWS access key and secret key:

access_key = "YOUR_AWS_ACCESS_KEY"

secret_key = "YOUR_AWS_SECRET_KEY"



### Step 5. Update Backend Configuration


- In envs/dev/backend.tf, update these fields:

bucket = "your-s3-bucket"

key = "your/path/to/terraform.tfstate"

region = "your-region"

### Step 7. Initialize and Apply Terraform


From the envs/dev/ directory, run:


terraform init     # Initializes Terraform and configures backend

terraform plan     # (Optional) Shows what will be created

terraform apply    # Provisions the infrastructure


### Requirements


1. Terraform CLI 

2. An existing AWS Key Pair (for EC2 access)

3. S3 bucket for state storage

4. Existing Key Pair

