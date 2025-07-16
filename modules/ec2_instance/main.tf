resource "aws_instance" "this" {
  count         = var.number_of_instances
  ami           = var.ami_id
  instance_type = var.instance_type
  ebs_optimized = var.ebs_optimized
  tenancy       = var.tenancy
  key_name      = var.key_pair_name

  iam_instance_profile = var.iam_instance_profile

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_on_termination
  }

  metadata_options {
    http_endpoint               = var.http_endpoint
    http_tokens                 = var.http_tokens
    http_put_response_hop_limit = var.http_put_response_hop_limit
  }

  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name        = "my-instance-${count.index + 1}"
    LaunchDay   = var.launch_day
    LaunchMonth = var.launch_month
  }
}
