AWS DC/OS Connections and Routes for Remote Region
============
This module creates creates the peer connection, peer accecpter, and the aws routes for remote regions for DC/OS on AWS for running Remote Agents.

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

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| remote_vpc_id | The VPC ID of the Remote VPC | string | - | yes |
| remote_region| The AWS Remote Region (ex: us-west-2, us-east-1) | string | - | yes |
| remote_route_table_id | ID of the Route Table for the Remote Region | string | - | yes |
| main_vpc_id | The VPC ID of the Main Region | string | - | yes |
| main_region | The Main Region where the Masters run (ex: us-west-2, us-east-1) | string | - | yes |
| main_route_table_id | ID of the Route Table for the Main Region | string | - | yes |
| main_subnet | The subnet range of the Main Region | string | - | yes |
| cluster_name | Cluster name all resources get named and tagged with | string | - | yes |
| tags | Custom tags added to the resources created by this module | map | `<map>` | no |


## Outputs