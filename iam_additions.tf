#-------------------------------------------------------------
# Attach AWS SSM policy
#-------------------------------------------------------------
resource "aws_iam_role_policy_attachment" "ec2ssm" {
  count      = "${var.iamssmpolicy ? 1 : 0}"
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
