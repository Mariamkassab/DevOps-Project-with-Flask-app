resource "google_compute_network" "mariam_vpc" {
  project                 = "my-fun-playground"
  name                    = "mariam-vpc-network"
  auto_create_subnetworks = false
}