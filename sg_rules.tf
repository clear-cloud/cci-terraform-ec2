#
# Loop var.ssh_access_sgs
#
resource "aws_security_group_rule" "sshaccess" {
  depends_on = ["aws_security_group.ec2_sg"]
  depends_on = ["aws_security_group.ec2_ssh_sg"]
  
  count                    = "${var.count}"
  #count                    = "${(length(split(",",var.ssh_access_sgs))) > 0 ? (length(split(",",var.ssh_access_sgs))) : 0}"
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "TCP"
  source_security_group_id = "${element(split(",", var.ssh_access_sgs),count.index)}"
  security_group_id        = "${element(split(aws_security_group.ec2_ssh_sg.id), count.index)}" 

#"${aws_security_group.ec2_ssh_sg.id}"
}

#
# Allow ec2 SELF
#
resource "aws_security_group_rule" "ec2_self_ingress" {
    depends_on = ["aws_security_group.ec2_sg"]
  depends_on = ["aws_security_group.ec2_ssh_sg"]
  count                    = "${var.count}"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  #source_security_group_id = "${aws_security_group.ec2_sg.id}"
  #security_group_id        = "${aws_security_group.ec2_sg.id}"
  source_security_group_id = "${element(split(aws_security_group.ec2_sg.id), count.index)}"
  security_group_id        = "${element(split(aws_security_group.ec2_sg.id), count.index)}"
}
