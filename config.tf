variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {default = "admin-key-pair-us-east-1"}

# AWS Provider definition
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "us-east-1"
}

# Resource definition

### Instances
# resource "aws_instance" "webserver" {
#     ami           = "ami-005fc0f236362e99f"
#     instance_type = "t2.micro"
#     key_name = "${var.key_name}" 

#     depends_on = ["aws_s3_bucket.mybucket"]   
# }

resource "aws_instance" "webserver" {
    ami           = "ami-005fc0f236362e99f"
    instance_type = "t2.micro"
    key_name = "${var.key_name}" 

    provisioner "local-exec" {
      command = "echo ${aws_instance.webserver.public_ip} > public_ip.txt"
    }
 
}

### Elastic IP
resource "aws_eip" "ip" {
  instance = "${aws_instance.webserver.id}" # example of implicit dependency
}

### s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = "mybucket-mutemip-s3"
}

# Output definition
output "aws_instance_public_dns" {
    value = "${aws_instance.webserver.public_dns}"
}