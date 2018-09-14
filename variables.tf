variable "remote_vpc_id" {
  description = "The VPC ID of the Remote VPC"
}

variable "remote_region" {
  description = "The AWS Remote Region (ex: us-west-2, us-east-1)"
}

variable "remote_route_table_id" {
  description = "ID of the Route Table for the Remote Region"
}

variable "auto_accept" {
  description = "Auto Accecpt Peering connections"
  default     = false
}

variable "main_vpc_id" {
  description = "The VPC ID of the Main Region"
}

variable "main_region" {
  description = "The Main Region where the Masters run (ex: us-west-2, us-east-1)"
}

variable "main_route_table_id" {
  description = "ID of the Route Table for the Main Region"
}

variable "main_subnet" {
  description = "The subnet range of the Main Region"
}

variable "cluster_name" {
  description = "Name of the DC/OS Cluster"
}

variable "tags" {
  description = "Custom tags added to the resources created by this module"
  type        = "map"
  default     = {}
}
