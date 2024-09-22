# Terraform-Assigment

Terraform VPC Module - 3-Tier Architecture
Overview
This Terraform module is designed to automate the creation of a VPC (Virtual Private Cloud) infrastructure following a 3-tier architecture. The module only requires the user to pass the VPC CIDR block and will handle the automatic provisioning of public and private subnets, route tables, NAT Gateway, Internet Gateway, and provides an option to integrate a Transit Gateway.

The architecture is optimized for scalable and secure cloud environments, ensuring network isolation between tiers, efficient routing, and internet access through managed gateways.

Features
VPC: Creates a Virtual Private Cloud with a user-defined CIDR block.
Subnets:
Automatically generates public and private subnets across multiple availability zones.
Public subnets for the web tier and private subnets for the application and database tiers.
Gateways:
Internet Gateway: Provides internet access for public subnets.
NAT Gateway: Enables internet access for private subnets while keeping them secure.
Transit Gateway (Optional): Can be integrated for inter-VPC or on-premise network communication.
Route Tables:
Separate route tables for public and private subnets to manage traffic flow.
Automatically associates subnets with their respective route tables.
Architecture
The 3-tier architecture includes:

Web Tier (Public Subnets)
Application Tier (Private Subnets)
Database Tier (Private Subnets)
Each tier is placed in its own subnet, ensuring proper isolation, security, and scalability.

Requirements
Terraform v0.12+
AWS Account with necessary permissions to create VPC resources.
Usage
hcl
Copy code
module "vpc" {
  source          = "./path-to-module"
  project         = "your_project_name"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  enable_nat_gw   = true        # Set to false if NAT Gateway is not required
  enable_tgw      = true        # Optional Transit Gateway integration
}
Inputs
Name	Description	Type	Default	Required
project	Name of the project for resource tagging	string	N/A	Yes
vpc_cidr	CIDR block for the VPC	string	N/A	Yes
azs	List of availability zones	list	N/A	Yes
enable_nat_gw	Toggle to enable/disable the NAT Gateway	bool	true	No
enable_tgw	Option to integrate Transit Gateway	bool	false	No
Outputs
Name	Description
vpc_id	The ID of the created VPC
public_subnets	List of public subnet IDs
private_subnets	List of private subnet IDs
nat_gw_id	NAT Gateway ID (if enabled)
igw_id	Internet Gateway ID
tgw_id	Transit Gateway ID (if enabled)
Resources Created
VPC
Public Subnets
Private Subnets
Internet Gateway (IGW)
NAT Gateway (Optional)
Transit Gateway (Optional)
Route Tables for public and private subnets.
How to Run
Clone this repository.
Navigate to the directory containing the Terraform files.
Initialize Terraform:
bash
Copy code
terraform init
Apply the Terraform plan:
bash
Copy code
terraform apply
Project Structure
bash
Copy code
.
├── main.tf                  # Main Terraform configuration
├── variables.tf             # Input variables definition
├── outputs.tf               # Output variables definition
├── README.md                # Project documentation
License
This project is licensed under the MIT License. See LICENSE for details.

Author
Paras-31
This README file provides a clear overview of the project, explains its functionality, and offers usage instructions with examples to help users get started easily.
