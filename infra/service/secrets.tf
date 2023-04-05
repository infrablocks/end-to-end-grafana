locals {
  grafana_dns_name = "${var.component}-${var.deployment_identifier}.${data.terraform_remote_state.domain.outputs.domain_name}"

  env_file_object_key = "grafana/service/environments/default.env"
  env_file_object_path = "s3://${var.secrets_bucket_name}/${local.env_file_object_key}"

  database_url = "postgres://${var.database_user}:${var.database_password}@${data.terraform_remote_state.database.outputs.postgres_database_host}/${var.database_name}"

  env = templatefile("${path.root}/envfiles/grafana.env.tpl", {
    grafana_port = var.grafana_service_container_port
    grafana_dns_name = local.grafana_dns_name
    grafana_admin_user = var.grafana_admin_user
    grafana_admin_password = var.grafana_admin_password
    database_url = local.database_url
    database_host = data.terraform_remote_state.database.outputs.postgres_database_host
    database_name = var.database_name
    database_user = var.database_user
    database_password = var.database_password
  })
}

resource "aws_s3_object" "env" {
  key = local.env_file_object_key
  bucket = var.secrets_bucket_name
  content = local.env

  server_side_encryption = "AES256"
}
