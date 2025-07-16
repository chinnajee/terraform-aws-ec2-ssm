variable "ami_id" {}
variable "instance_type" {}
variable "ebs_optimized" {}
variable "tenancy" {}
variable "key_pair_name" {}
variable "iam_instance_profile" {}

variable "volume_type" {}
variable "volume_size" {}
variable "delete_on_termination" {}

variable "http_endpoint" {}
variable "http_tokens" {}
variable "http_put_response_hop_limit" {}

variable "security_group_ids" { type = list(string) }

variable "launch_day" {}
variable "launch_month" {}
variable "number_of_instances" {}
