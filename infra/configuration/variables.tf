variable "grafana_user" {}
variable "grafana_password" {}

variable "service_state_key" {}
variable "service_state_bucket_name" {}
variable "service_state_bucket_region" {}
variable "service_state_bucket_is_encrypted" {
  default = true
  nullable = false
}
