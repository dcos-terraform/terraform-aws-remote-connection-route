variable "remote_vpc_id" {}
variable "remote_region" {}
variable "remote_route_table_id" {}
variable "main_region" {}
variable "main_vpc_id" {}
variable "main_subnet" {}
variable "main_route_table_id" {}
variable "cluster_name" {}

variable "tags" {
  description = "Custom tags added to the resources created by this module"
  type        = "map"
  default     = {}
}
