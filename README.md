# cci-terraform-ec2
Creates ec2 instances with Statically assigned IPs.

IPs are set via a map when the module is called, for example:

  
  
  ips = [{
   "0" = "10.101.4.11" #hostname-001
  }]

