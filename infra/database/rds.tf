module "database" {
  source = "infrablocks/rds-postgres/aws"
  version = "1.3.0"

  component = var.component
  deployment_identifier = var.deployment_identifier

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  private_subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids
  private_network_cidr = var.private_network_cidr

  database_instance_class = var.database_instance_type
  database_version = var.database_version

  database_name = var.database_name
  database_master_user_password = var.database_master_user_password
  database_master_user = var.database_master_user

  allocated_storage = var.allocated_storage

  use_encrypted_storage = var.use_encrypted_storage
  use_multiple_availability_zones = var.use_multiple_availability_zones
}
