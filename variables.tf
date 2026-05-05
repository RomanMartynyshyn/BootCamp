variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "eu-north-1"

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.region))
    error_message = "The region must be a valid AWS region name (e.g. eu-north-1, us-east-1)."
  }
}

variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 2

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "Instance count must be between 1 and 10."
  }
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"

  validation {
    condition     = can(regex("^[a-z][0-9][a-z]?\\.(nano|micro|small|medium|large|xlarge|[0-9]+xlarge)$", var.instance_type))
    error_message = "Must be a valid EC2 instance type (e.g. t3.micro, m5.large)."
  }
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances. Must match the selected region."
  type        = string
  # Ubuntu 24.04 LTS in eu-north-1
  default     = "ami-0989fb15ce71ba39e"
}

variable "key_name" {
  description = "Name of the existing AWS Key Pair to enable SSH access to instances."
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to connect via SSH (port 22). Restrict to your IP for security."
  type        = string
  default     = "0.0.0.0/0"

  validation {
    condition     = can(cidrhost(var.allowed_ssh_cidr, 0))
    error_message = "Must be a valid CIDR block (e.g. 203.0.113.0/32)."
  }
}

variable "project_name" {
  description = "Name of the project, used as a prefix for all resource names and tags."
  type        = string
  default     = "bootcamp"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}