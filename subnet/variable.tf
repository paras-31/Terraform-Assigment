variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}



variable "project" {
  description = "The name of the project"
  type        = string
}



variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "vpc_id" {
  type = string
}