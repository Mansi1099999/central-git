resource "google_project_service" "iap" {
  project = "custom-camp-509418-n8"
  service = "iap.googleapis.com"
}

resource "google_project_service" "iap-1" {
  project = "custom-camp-509418-n8"
  service = "compute.googleapis.com"
}

resource "google_project_service" "iap-2" {
  project = "custom-camp-509418-n8"
  service = "oslogin.googleapis.com"
}

resource "google_project_service" "iap-3" {
  project = "custom-camp-509418-n8"
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "iap-4" {
  project = "custom-camp-509418-n8"
  service = "serviceusage.googleapis.com"
}
