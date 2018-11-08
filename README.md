AWS DC/OS Remote Connections and Routes for Remote Region (NOTE: THIS IS CURRENTLY EXPERIMENTAL AND NOT YET SUPPORTED)
===========
This module creates the connections and routes between main and remote regions in AWS for DC/OS Cluster for remote Agents

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
| cluster_name | Name of the DC/OS cluster | string | - | yes |
| main_region | The Main Region where the Masters run (ex: us-west-2, us-east-1) | string | - | yes |
| main_route_table_id | ID of the Route Table for the Main Region | string | - | yes |
| main_subnet | The subnet range of the Main Region | string | - | yes |
| main_vpc_id | The VPC ID of the Main Region | string | - | yes |
| remote_region | The AWS Remote Region (ex: us-west-2, us-east-1) | string | - | yes |
| remote_route_table_id | ID of the Route Table for the Remote Region | string | - | yes |
| remote_vpc_id | The VPC ID of the Remote VPC | string | - | yes |
| tags | Add custom tags to all resources | map | `<map>` | no |

