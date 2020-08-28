provider "aws" {
  region = var.region
  version = "~> 3.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
