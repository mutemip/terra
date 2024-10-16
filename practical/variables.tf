variable "project_name" {
  description = "Name of the project"
  type = string
  default = "practical"
}

locals {
  default_prefix = "${var.project_name}-webserver"
}

variable "ami" {
    description = "Machine image for the project"
    type = string
    default = "ami-005fc0f236362e99f"
}

variable "instance_type" {
  description = "project instance type"
  type = string
  default = "t2.micro"
}
