output "ec2_ids" {
  value = "${join(",",aws_instance.ec2.*.id)}"
}

