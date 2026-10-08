resource "google_storage_bucket" "state-exp" {
  name     = "my-prac-buc"
  location = "US"

  # Optional settings
  force_destroy = true
  uniform_bucket_level_access = true
}