resource "google_compute_network" "vpc"{
    name = "my-vpc"
}

resource "google_compute_subnetwork" "subnet"{
    name = "db"
    network = google_compute_network.vpc.name #interpoalating the network name from the vpc resource
    ip_cidr_range = "10.1.0.0/28"
    region = var.region 
    #count  = var.region == "us-central1" ? 1 : 0 #conditional statement to creat evm only if region is us-central1
    }


    resource "google_compute_instance" "vm_instance"{
      #count = 2
        network_interface {
    network = google_compute_network.vpc.name
    access_config {
      # empty block = ephemeral external IP
    }
        }
    depends_on = [google_compute_subnetwork.subnet]
    #name = "my-vm${count.index}" 
    # for_each = tomap({
    #   "vm-1" = "e2-micro"
    #   "vm-2" = "e2-micro"

    # })
    count  = var.region == "us-east1" ? 1 : 0 #conditional statement to creat evm only if region is us-central1
    machine_type = var.machine_type
    name = "vm-dev"
    tags = [var.tags]
    metadata = {
    enable-oslogin = "TRUE"
    startup-script = file("${path.module}/install_nginx.sh")
  }
    zone = var.zone
    
    boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        my_label = "value"
      }
    }
  }
    }