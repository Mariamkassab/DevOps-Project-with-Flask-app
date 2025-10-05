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



resource "google_service_account" "github_deployer" {
  account_id   = "github-deployer"
  display_name = "GitHub Actions GKE Deployer"
}

# Grant container.admin role
resource "google_project_iam_member" "container_admin_binding" {
  project = "my-fun-playground"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.github_deployer.email}"
}

# Grant storage.admin role
resource "google_project_iam_member" "storage_admin_binding" {
  project = "my-fun-playground"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.github_deployer.email}"
}