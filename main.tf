provider "aws" {
  region = "us-east-1"
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source = "./modules/ec2_instance"

  ami_id                   = "ami-020cba7c55df1f615"
  instance_type            = var.instance_type
  ebs_optimized            = var.ebs_optimized
  tenancy                  = var.instance_tenancy[0]
  key_pair_name            = var.key_pair_name
  iam_instance_profile     = module.iam.instance_profile_name

  volume_type              = var.root_block_device.volume_type
  volume_size              = var.root_block_device.volume_size
  delete_on_termination    = var.root_block_device.delete_on_termination

  http_endpoint            = var.metadata_options.http_endpoint
  http_tokens              = var.metadata_options.http_tokens
  http_put_response_hop_limit = var.metadata_options.http_put_response_hop_limit

  security_group_ids       = var.security_group_ids
  launch_day               = var.launchDate[0]
  launch_month             = var.launchDate[1]
  number_of_instances      = var.number_of_instances
}
