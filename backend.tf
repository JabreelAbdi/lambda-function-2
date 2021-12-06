terraform {
  backend "s3" {
    bucket = "talent-academy-jabreelabdi"
    key    = "terraform-lambda2/terraform.tfstates"
  }
}