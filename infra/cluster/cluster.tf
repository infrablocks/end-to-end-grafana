module "ecs_cluster" {
  source = "infrablocks/ecs-cluster/aws"
  version = "6.0.0"

  region = var.region
  vpc_id = data.terraform_remote_state.tooling_network.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.tooling_network.outputs.private_subnet_ids
  default_ingress_cidrs = [var.private_network_cidr]

  component = var.component
  deployment_identifier = var.deployment_identifier

  cluster_instance_ssh_public_key_path = var.cluster_instance_ssh_public_key_path
  cluster_instance_type = var.cluster_instance_type

  cluster_minimum_size = 2
  cluster_maximum_size = 4
  cluster_desired_capacity = 3
}
