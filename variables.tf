variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}

terraform {

  # required_providers {
  #   aws = {
  #     source = "hashicorp/aws"
  #     version = "~> 3.0"
  #   }
  # } 

  ## Setting up terraform cloud
  cloud { 
    organization = "Mutemip-ORG" 
    workspaces { 
      name = "terra-workspace" 
    } 
  } 
}
variable "key_name" {
    default = "admin-key-pair-us-east-1"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "zones" {
  type = list
  default = [
    "us-east-1a", "us-east-1b", "us-east-1c",
    ]
}

variable "images" {
  type = map
  default = {
    "us-east-1" = "ami-005fc0f236362e99f"
    "us-east-2" = "ami-00eb69d236edcfaf8"
  }
}

variable "size" {
  type = map
  default = {
    tiny = "t1.micro"
    small = "t2.micro"
    medium = "t2.medium"
    # large = "t2.large"
    # xlarge = "t2.xlarge"
  }
}