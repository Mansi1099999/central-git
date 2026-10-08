output "vm_internal_ip"{
    value = [for key in google_compute_instance.vm_instance: key.network_interface[0].network_ip]
}