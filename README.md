AWS DC/OS Connections and Routes for Remote Region
============
This module creates creates the peer connection, peer accecpter, and the aws routes for remote regions for DC/OS on AWS for running Remote Agents.

*** NOTE: This is extremely experimental and Mesoshpere DOES NOT officially support this module currently 


EXAMPLE
-------

```hcl
module "remote_connection_route" {
  source                = "dcos-terraform/remote-connection-route/aws"
  remote_vpc_id         = "vpc-987a65b4"
  remote_region         = "us-west-2"
  remote_route_table_id = "rtb-01234567ab"

  main_vpc_id           = "vpc-123z45y4"
  main_region           = "us-east-1"
  main_subnet           = "10.0.0.0/8"
  main_route_table_id   = "rtb-ab123456789"
  
  cluster_name          = "dcos-cluster"
  
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| remote_vpc_id | The VPC ID of the Remote VPC | string | - | yes |
| remote_region| The AWS Remote Region (ex: us-west-2, us-east-1) | string | - | yes |
| remote_route_table_id | ID of the Route Table for the Remote Region | string | - | yes |
| auto_accept | Auto Accept peer connections | string | false | no |
| main_vpc_id | The VPC ID of the Main Region | string | - | yes |
| main_region | The Main Region where the Masters run (ex: us-west-2, us-east-1) | string | - | yes |
| main_route_table_id | ID of the Route Table for the Main Region | string | - | yes |
| main_subnet | The subnet range of the Main Region | string | - | yes |
| cluster_name | Cluster name all resources get named and tagged with | string | - | yes |
| tags | Custom tags added to the resources created by this module | map | `<map>` | no |


## Outputs