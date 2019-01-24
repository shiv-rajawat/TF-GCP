provider "google" {
  credentials = "./creds/serviceaccount.json"
  project     = "terraform-testing-229612"
  region      = "us-central1"
}

terraform {
  backend "gcs" {
    bucket  = "shiv-g-tf-state-bucket"
    prefix  = "terraform/state"
  }
}

module "gcs" {
  source = "Modules/CloudStorage"
  count  = "${var.count}"
  name   = "${var.bucket_names}"
  location = "${var.location}"
}
