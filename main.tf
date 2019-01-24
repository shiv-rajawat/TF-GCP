provider "google" {
  credentials = "./creds/serviceaccount.json"
  project     = "terraform-testing-229612"
  region      = "us-central1"
}

terraform {
  backend "gcs" {
    bucket  = "shiv-g-tf-state-bucket"
    prefix  = "terraform/state"
    credentials = "./creds/serviceaccount.json"
  }
}

module "gcs" {
  source = "Modules/CloudStorage"
  count  = "${var.count}"
  bucket_names   = "${var.bucket_names}"
  location = "${var.location}"
}

module "vm" {
  source = "Modules/ComputeEngine"
  vm_name = "${var.vm_name}"
}
