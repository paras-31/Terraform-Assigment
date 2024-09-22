# Terraform VPC Module - 3-Tier Architecture

## Overview

This Terraform module automates the creation of a VPC infrastructure following a 3-tier architecture. The module provisions public and private subnets, route tables, an Internet Gateway (IGW), a NAT Gateway, and optionally a Transit Gateway. It requires the user to provide only the VPC CIDR block.

## Features

- **VPC**: Creates a Virtual Private Cloud with a specified CIDR block.
- **Subnets**: Public and private subnets across multiple availability zones.
- **Gateways**: Internet Gateway (IGW), NAT Gateway (optional), Transit Gateway (optional).
- **Route Tables**: Automatically assigns public and private subnets to their route tables.

## Inputs

| Name           | Description                               | Type         | Default | Required |
|----------------|-------------------------------------------|--------------|---------|----------|
| `project`      | Name of the project for resource tagging   | string       | N/A     | Yes      |
| `vpc_cidr`     | CIDR block for the VPC                    | string       | N/A     | Yes      |
| `azs`          | List of availability zones                | list(string) | N/A     | Yes      |
| `enable_nat_gw`| Toggle to enable/disable the NAT Gateway   | bool         | true    | No       |
| `enable_tgw`   | Option to integrate Transit Gateway       | bool         | false   | No       |

## Outputs

| Name             | Description                          |
|------------------|--------------------------------------|
| `vpc_id`         | The ID of the created VPC            |
| `public_subnets` | List of public subnet IDs            |
| `private_subnets`| List of private subnet IDs           |
| `nat_gw_id`      | NAT Gateway ID (if enabled)          |
| `igw_id`         | Internet Gateway ID                 |
| `tgw_id`         | Transit Gateway ID (if enabled)      |

## Resources Created

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway (IGW)
- NAT Gateway (Optional)
- Transit Gateway (Optional)
- Route Tables for public and private subnets

## How to Run

1. Clone this repository.
2. Navigate to the directory containing the Terraform files.
3. Initialize Terraform:
   ```bash
   terraform init


terraform apply

## Project Structure
.
├── main.tf                  # Main Terraform configuration
├── variables.tf             # Input variables definition
├── outputs.tf               # Output variables definition
├── README.md                # Project documentation

## Author
Paras-31

This format should now display correctly when copied into your `README.md` file on GitHub.
