#-------------------------------------------------------------
# Attach AWS SSM policy
#-------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ec2ssm" {
  count      = "${var.iamssmpolicy ? 1 : 0}"
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

#-------------------------------------------------------------
# Attach AWS s3 RO policy
#-------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ec2s3ro" {
  count      = "${var.iams3ropolicy ? 1 : 0}"
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}



