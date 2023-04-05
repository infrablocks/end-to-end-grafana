variable "region" {}
variable "component" {}
variable "deployment_identifier" {}

variable "domain_name" {}

variable "service_desired_count" {}

variable "secrets_bucket_name" {}

variable "database_name" {}
variable "database_user" {}
variable "database_password" {}

variable "grafana_image" {}
variable "grafana_service_container_port" {}
variable "grafana_service_host_port" {}
variable "grafana_service_lb_port" {}
variable "grafana_admin_user" {}
variable "grafana_admin_password" {}
variable "grafana_allow_cidrs" {
  type = list(string)
}

variable "domain_state_key" {}
variable "domain_state_bucket_name" {}
variable "domain_state_bucket_region" {}
variable "domain_state_bucket_is_encrypted" {
  default = true
  nullable = false
}

variable "network_state_key" {}
variable "network_state_bucket_name" {}
variable "network_state_bucket_region" {}
variable "network_state_bucket_is_encrypted" {
  default = true
  nullable = false
}

variable "cluster_state_key" {}
variable "cluster_state_bucket_name" {}
variable "cluster_state_bucket_region" {}
variable "cluster_state_bucket_is_encrypted" {
  default = true
  nullable = false
}

variable "database_state_key" {}
variable "database_state_bucket_name" {}
variable "database_state_bucket_region" {}
variable "database_state_bucket_is_encrypted" {
  default = true
  nullable = false
}
