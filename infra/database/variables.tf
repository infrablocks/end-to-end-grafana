variable "region" {}
variable "private_network_cidr" {}

variable "component" {}
variable "deployment_identifier" {}

variable "database_instance_type" {}
variable "database_version" {}
variable "database_name" {}
variable "database_master_user" {}
variable "database_master_user_password" {}

variable "allocated_storage" {}

variable "network_state_bucket_name" {}
variable "network_state_key" {}
variable "network_state_bucket_region" {}
variable "network_state_bucket_is_encrypted" {}

variable "use_encrypted_storage" {}
variable "use_multiple_availability_zones" {}
