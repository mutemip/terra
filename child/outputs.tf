output "received" {
  value = "${var.memory}"
  description = "Getting memory from config.tf and outputting it as received"
}

output "space" {
  value = "120GB"
  description = "Space for AMI storage"
}

output "project_resource_type" {
  value = "${local.default_prefix}-EC2"
  description = "value of project_resource_type"
}