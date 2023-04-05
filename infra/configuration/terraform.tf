terraform {
  required_version = ">= 1.3"

  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "1.36.1"
    }
  }

  backend "s3" {}
}
