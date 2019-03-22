variable "ssh_access_sgs" {
 default = ""
}

variable "ebs_optimized" {
  description = "Allows for setting EBS optimized settings"
  default = "false"
}

variable "ami" {
  description = "AMI to be used to build the ec2 instance"
}

variable "platform" {
  description = "One of windows or linux"
  default     = "linux"
}

variable "vol2_size" {
  description = "size of secondary volume"
  default     = "50"
}

variable "vpc_id" {}
variable "environment" {}
variable "key_name" {}

variable "instance_type" {
  default = "t3.micro"
}

variable "root_volume_size" {
  default = "30"
}

variable "contact" {}
variable "count" {
  description = "Number of servers to build"
  default     = "1"
}

variable "hostname_prefix" {
  description = "Hostname prefix"
}

variable "hostname_offset" {
  default = "0"
}

variable "domain_name" {}
variable "subnet_id" {}
variable "availability_zones" {}
variable "zone_id" {}
variable "orchestration" {}
variable "encrypted" {
  description = "Enables / Disables encryption of volumes"
  default     = "false"
}

variable "supplementary_user_data" {
  description = "Supplementary shell script commands for adding to user data"
  default = "" 
}
#
# Vars for optional IAM policiees
#
variable "iamssmpolicy" {
  description = "attach Global Role arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  default = "1"
}
