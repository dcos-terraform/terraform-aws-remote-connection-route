AWS REMOTE CONNECTIONS AND ROUTES
============
This module creates creates the peer connection, peer accecpter, and the aws routes for remote regions for DC/OS on AWS.

*** NOTE: This is extremely experimental and Mesoshpere DOES NOT officially support this module currently 


EXAMPLE
-------

```hcl
module "remote_connection_route" {
  source                = "/Users/westonbassler/Documents/git-repos/dcos-terraform-aws-remote-connection-route"
  remote_vpc_id         = "${module.remote_region_vpc.vpc_id}"
  remote_region         = "${var.remote_region}"
  remote_route_table_id = "${module.remote_region_vpc.aws_main_route_table_id}"

  main_vpc_id           = "${module.vpc.vpc_id}"
  main_region           = "${var.region}"
  main_subnet           = "${var.subnet_range}"
  main_route_table_id   = "${module.vpc.aws_main_route_table_id}"
  
  cluster_name        = "${var.prefix}"
  tags                = "${var.tags}"
  
}
```