provider "grafana" {
  url = "https://${data.terraform_remote_state.service.outputs.address}"
  auth = "${var.grafana_user}:${var.grafana_password}"
  version = "~> 1.5"
}
