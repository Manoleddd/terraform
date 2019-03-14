resource "oci_load_balancer" "lb2" {
  shape          = "100Mbps"
  compartment_id = "${var.compartment_ocid}"
defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
  subnet_ids = [
    "${oci_core_subnet.LBA2.id}",
    "${oci_core_subnet.LBB2.id}",
  ]

  display_name = "lb2"
}

resource "oci_load_balancer_backend_set" "lb-bes2" {
  name             = "lb-bes2"
  load_balancer_id = "${oci_load_balancer.lb2.id}"
  policy           = "ROUND_ROBIN"

  health_checker {
    port                = "80"
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "/"
  }
}

resource "oci_load_balancer_backend" "lb-beA" {
  load_balancer_id = "${oci_load_balancer.lb2.id}"
  backendset_name  = "${oci_load_balancer_backend_set.lb-bes2.name}"
  ip_address       = "${oci_core_instance.WordpressA.private_ip}"
  port             = 80
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

resource "oci_load_balancer_backend" "lb-beB" {
  load_balancer_id = "${oci_load_balancer.lb2.id}"
  backendset_name  = "${oci_load_balancer_backend_set.lb-bes2.name}"
  ip_address       = "${oci_core_instance.WordpressB.private_ip}"
  port             = 80
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

resource "oci_load_balancer_listener" "lb-listener2" {
  load_balancer_id         = "${oci_load_balancer.lb2.id}"
  name                     = "http"
  default_backend_set_name = "${oci_load_balancer_backend_set.lb-bes2.name}"
  # hostname_names           = ["${oci_load_balancer_hostname.test_hostname1.name}", "${oci_load_balancer_hostname.test_hostname2.name}"]
  port                     = 80
  protocol                 = "HTTP"

  connection_configuration {
    idle_timeout_in_seconds = "2"
  }
}