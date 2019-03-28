#-------------------------------------------------------------
# IAM Role & IAM Profile
#-------------------------------------------------------------

resource "aws_iam_instance_profile" "ec2_profile" {
  depends_on = ["aws_iam_role.ec2_role"]
  name       = "ec2.ec2-profile.${var.environment}.${var.build_ref}.${count.index + var.hostname_offset}"
  role       = "${aws_iam_role.ec2_role.name}"
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2.${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}.${var.domain_name}.${var.environment}.${count.index}"
  path = "/"

  assume_role_policy = <<EOF
{"Version": "2012-10-17",
"Statement": [
{
"Action": "sts:AssumeRole",
"Principal": {
"Service": "ec2.amazonaws.com"
},
"Effect": "Allow",
"Sid": ""
}
]
}
EOF
}
