# Module definition
module "child" {
    source = "./child"

    name = "example-module"
    description = "This is an example module"
    memory = "8GB"
    project_name = "example-project"
}

# AWS Provider definition
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.region}"
}

# Resource definition

### Instances
# resource "aws_instance" "webserver" {
#     ami           = "ami-005fc0f236362e99f"
#     instance_type = "t2.micro"
#     key_name = "${var.key_name}" 

#     depends_on = ["aws_s3_bucket.mybucket"]   
# }

# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "devops-tf-state-mutemip"
#   force_destroy = true

#   versioning {
#     enabled = true
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform_locks" {
#   name = "devops-locks-mutemip"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

resource "aws_instance" "webserver" {

    count = 3
    ami           = "${lookup(var.images, var.region)}"
    instance_type = "${var.size["small"]}"
    key_name      = "${var.key_name}" 

    tags = {
      name = "webserver-${count.index + 1}"
    }

    # provisioner "local-exec" {
    #   command = "echo ${aws_instance.webserver.public_ip} > public_ip.txt"
    # }

    provisioner "local-exec" {
      when = destroy
      command = "echo ${self.private_dns} destroyed > public_ip.txt"
    }
 
}


### Elastic IP
# resource "aws_eip" "ip" {
#   instance = "${aws_instance.webserver.id}" # example of implicit dependency
# }

# ### s3 bucket
# resource "aws_s3_bucket" "mybucket" {
#   bucket = "mybucket-mutemip-s3"
# }

# Output definition
# output "aws_instance_public_dns" {
#   value = "${aws_instance.webserver.public_dns}"
# }

output "child_received" {
  value = "${module.child.received}"
}

output "child_space" {
  value = "${module.child.space}"
}

output "child_project_resource_type" {
  value = "${module.child.project_resource_type}"
}