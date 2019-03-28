#
# ec2 access SG
#
resource "aws_security_group" "ec2_sg" {
  name        = "sg.${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}.${var.domain_name}"
  description = "sg.${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}.${var.domain_name}"
  vpc_id      = "${var.vpc_id}"

  # Allow all outbound traffic

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    "environment"   = "${var.environment}"
    "contact"       = "${var.contact}"
    "orchestration" = "${var.orchestration}"
  }
}

#
# ec2 SSH SG
#
resource "aws_security_group" "ec2_ssh_sg" {
  name        = "sg.${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}.${var.domain_name}.ssh.access"
  description = "sg.${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}.${var.domain_name}.ssh.access"
  vpc_id      = "${var.vpc_id}"

  # Allow all outbound traffic

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    "environment"   = "${var.environment}"
    "contact"       = "${var.contact}"
    "orchestration" = "${var.orchestration}"
  }
}
