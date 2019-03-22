#
# Loop var.ssh_access_sgs
#
resource "aws_security_group_rule" "sshaccess" {
  count       = "${length(split(",",var.sshaccess_sgs))}"
  type        = "ingress"
  from_port   = "22"
  to_port     = "22"
  protocol    = "TCP"
  source_security_group_id = "${element(split(",",var.ssh_access_sgs),count.index)}"
  security_group_id = "${aws_security_group.ec2_ssh_sg.id}"
}







#
# Allow ec2 SELF
#
resource "aws_security_group_rule" "ec2_self_ingress" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  source_security_group_id = "${aws_security_group.ec2_sg.id}"
  security_group_id        = "${aws_security_group.ec2_sg.id}"
}
