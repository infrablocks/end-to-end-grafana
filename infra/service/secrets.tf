locals {
  env_file_object_key = "grafana/service/environments/default.env"
}

data "template_file" "grafana_dns_name" {
  template = "$${component}-$${deployment_identifier}.$${domain}"

  vars = {
    component = var.component
    deployment_identifier = var.deployment_identifier
    domain = data.terraform_remote_state.domain.outputs.domain_name
  }
}

data "template_file" "env_file_object_path" {
  template = "s3://$${secrets_bucket}/$${environment_object_key}"

  vars = {
    secrets_bucket = var.secrets_bucket_name
    environment_object_key = local.env_file_object_key
  }
}

data "template_file" "database_url" {
  template = "postgres://$${username}:$${password}@$${address}/$${name}"

  vars = {
    name = var.database_name
    username = var.database_user
    password = var.database_password
    address = data.terraform_remote_state.database.outputs.postgres_database_host
  }
}

data "template_file" "env" {
  template = file("${path.root}/envfiles/grafana.env.tpl")

  vars = {
    grafana_port = var.grafana_service_container_port
    grafana_dns_name = data.template_file.grafana_dns_name.rendered
    grafana_admin_user = var.grafana_admin_user
    grafana_admin_password = var.grafana_admin_password
    database_url = data.template_file.database_url.rendered
    database_host = data.terraform_remote_state.database.outputs.postgres_database_host
    database_name = var.database_name
    database_user = var.database_user
    database_password = var.database_password
  }
}

resource "aws_s3_bucket_object" "env" {
  key = local.env_file_object_key
  bucket = var.secrets_bucket_name
  content = data.template_file.env.rendered

  server_side_encryption = "AES256"
}
