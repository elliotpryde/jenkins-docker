# resource "google_compute_instance" "default" {
#   name         = "example"
#   machine_type = "f1-micro"
#   zone         = "europe-west2-c"
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-8"
#     }
#   }
#   network_interface {
#     network = "default"
#     access_config {
#       // Having this block creates an ephemeral IP which is accessible from the internet
#     }
#   }
# }

