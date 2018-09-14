/**
* AWS DC/OS Remote Connections and Routes for Remote Region
* ===========
* This module creates the connections and routes between main and remote regions in AWS for DC/OS Cluster for remote Agents
*
* EXAMPLE
* -------
*
*```hcl
*module "remote_connection_route" {
*  source                = "dcos-terraform/remote-connection-route/aws"
*  remote_vpc_id         = "vpc-987a65b4"
*  remote_region         = "us-west-2"
*  remote_route_table_id = "rtb-01234567ab"
*
*  main_vpc_id           = "vpc-123z45y4"
*  main_region           = "us-east-1"
*  main_subnet           = "10.0.0.0/8"
*  main_route_table_id   = "rtb-ab123456789"
*  
*  cluster_name          = "dcos-cluster"
*  
*}
*```
*/

provider "aws" {
  alias  = "remote"
  region = "${var.remote_region}"
}

provider "aws" {
  alias  = "main"
  region = "${var.main_region}"
}

resource "aws_vpc_peering_connection" "remote_region_peering" {
  provider    = "aws.remote"
  peer_vpc_id = "${var.main_vpc_id}"
  peer_region = "${var.main_region}"
  vpc_id      = "${var.remote_vpc_id}"
  auto_accept = "${var.auto_accept}"

  tags {
    Name = "${var.cluster_name}-remote"
  }
}

resource "aws_vpc_peering_connection_accepter" "main_region_peering" {
  provider = "aws.main"

  vpc_peering_connection_id = "${aws_vpc_peering_connection.remote_region_peering.id}"
  auto_accept               = "${var.auto_accept}"

  tags {
    Name = "${var.cluster_name}-main"
  }
}

resource "aws_route" "main_to_remote_routing" {
  provider = "aws.main"

  route_table_id         = "${var.main_route_table_id}"
  destination_cidr_block = "${cidrsubnet(var.main_subnet, 1, 1)}"
  gateway_id             = "${aws_vpc_peering_connection.remote_region_peering.id}"
}

resource "aws_route" "remote_to_main_routing" {
  provider = "aws.remote"

  route_table_id         = "${var.remote_route_table_id}"
  destination_cidr_block = "${cidrsubnet(var.main_subnet, 1, 0)}"
  gateway_id             = "${aws_vpc_peering_connection.remote_region_peering.id}"
}
