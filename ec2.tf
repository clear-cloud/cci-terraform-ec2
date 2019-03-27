#---------------------------------------------------------------
# Creates ec2
#---------------------------------------------------------------
resource "aws_instance" "ec2" {
  depends_on = ["aws_security_group.ec2_sg"]
  depends_on = ["aws_security_group.ec2_ssh_sg"]

  count             = "${var.count}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  key_name          = "${var.key_name}"
  subnet_id         = "${element(split(",", var.subnet_id), count.index)}"
  count             = "${var.count}"
  instance_type     = "${var.instance_type}"
  ebs_optimized     = "${var.ebs_optimized}"

  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.root_volume_size}"
  }

  user_data = "${element(data.template_file.userdata.*.rendered, count.index)}"

  #
  # Apply userdata and AMI only once
  #  
  lifecycle {
    ignore_changes = ["user_data", "ami"]
  }

  ami                    = "${var.ami}"
  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}", "${aws_security_group.ec2_ssh_sg.id}"]
  iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.id}"

  private_ip = "${lookup(var.ips,count.index, unset)}"

  #-----------------------------------------------------------------
  # Tags
  #-----------------------------------------------------------------
  tags {
    Name            = "${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}"
    "environment"   = "${var.environment}"
    "contact"       = "${var.contact}"
    "orchestration" = "${var.orchestration}"
  }
}

#
# User data rendered
#

data "template_file" "userdata" {
  template = "${file("${path.module}/${var.platform}/userdata")}"
  count    = "${var.count}"

  vars {
    appliedhostname         = "${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}"
    domain_name             = "${var.domain_name}"
    environment             = "${var.environment}"
    supplementary_user_data = "${var.supplementary_user_data}"
    aws_region              = "${var.aws_region}"
  }
}
