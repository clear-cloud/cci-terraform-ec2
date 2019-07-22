output "ec2_ids" {
  value = "${join(",",aws_instance.ec2.*.id)}"
}

output "ec2_sg" {
  value = "${aws_security_group.ec2_sg.id}"
}
