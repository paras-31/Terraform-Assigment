
variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable "enable_transit_gateway" {
  description = "Enable Transit Gateway creation"
  type        = bool
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}


variable "public_subnet" {
  type = list(any)
}

variable "private_subnet" {
  type = list(any)
}

variable "nat" {
  type = string
}