
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "project" {
  description = "The name of the project"
  type        = string
  default = "Terraform-Assigment"
}

variable "enable_transit_gateway" {
  description = "Enable Transit Gateway creation with vpc (Pass true/false value)"
  type        = bool
}


variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}
