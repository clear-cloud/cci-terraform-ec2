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
    "Environment"   = "${var.environment}"
    "Contact"       = "${var.contact}"
    "Orchestration" = "${var.orchestration}"
  }
}
