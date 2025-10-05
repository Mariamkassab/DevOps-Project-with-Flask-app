resource "google_service_account" "gke-service-account" {
  account_id = "gke-service-account"
  display_name = "gke-service-account"
  project = "my-fun-playground"
}

resource "google_project_iam_binding" "gke-service-account-iam" {
  project = "my-fun-playground"
  role    = "roles/container.developer"
  members = [
    "serviceAccount:${google_service_account.gke-service-account.email}"
  ]
}