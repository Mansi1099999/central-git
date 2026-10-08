resource "google_compute_firewall" "iap" {
  name    = "iap-firewall"
  network = google_compute_network.vpc.name
  project   = "custom-camp-509418-n8"
  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22" , "80" ,"3389"]
  }

   source_ranges = ["35.235.240.0/20"]
}
