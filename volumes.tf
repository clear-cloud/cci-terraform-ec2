#---------------------------------------------------------------
#  ec2 Volumes
#---------------------------------------------------------------

resource "aws_ebs_volume" "vol2" {
  count             = "${var.count}"
  availability_zone = "${element(split(",", var.availability_zones), count.index)}"
  size              = "${var.vol2_size}"
  type              = "gp2"
  encrypted         = "${var.encrypted}"

  tags {
    "hostname"      = "${var.hostname_prefix}${format("%03d", count.index + 1 + var.hostname_offset)}"
    "Environment"   = "${var.environment}"
    "Contact"       = "${var.contact}"
    "Orchestration" = "${var.orchestration}"
  }
}
