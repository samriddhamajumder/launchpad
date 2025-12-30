terraform {
  backend "s3" {
    bucket         = "launchpad-s3-bucket-99"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "launchpad-table-dynamodb"
    encrypt        = true
  }
}
