terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket        = "roboshop-s3-dev-project"
    key           = "robo-sg-rules.tfstate"
    region        = "us-east-1"
    encrypt       = true
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}