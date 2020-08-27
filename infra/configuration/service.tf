data "terraform_remote_state" "service" {
  backend = "s3"

  config = {
    bucket = var.service_state_bucket_name
    key = var.service_state_key
    region = var.service_state_bucket_region
    encrypt = var.service_state_bucket_is_encrypted
  }
}
