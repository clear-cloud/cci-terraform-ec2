#---------------------------------------------------------------
# ec2 attachments
#---------------------------------------------------------------

resource "aws_volume_attachment" "attach_vol2" {
  count       = "${var.count}"
  device_name = "/dev/xvdd"
  volume_id   = "${element(aws_ebs_volume.vol2.*.id, count.index)}"
  instance_id = "${element(aws_instance.ec2.*.id, count.index)}"
}
