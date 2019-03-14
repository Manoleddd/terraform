resource "oci_core_instance" "WebServerA" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "WebServerA"
  shape               = "${var.InstanceShapeBMGPU}"
  subnet_id           = "${oci_core_subnet.WBA.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
 # hostname_label      = "WebServerA"

#use this to install httpd role
  metadata {
    user_data = "${base64encode(var.user-data)}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.InstanceImageOCID}"
  }
}

resource "oci_core_instance" "WebServerB" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "WebServerB"
  shape               = "${var.InstanceShape}"
  subnet_id           = "${oci_core_subnet.WBB.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
 # hostname_label      = "WebServerB"

#use this to install httpd role
  metadata {
    user_data = "${base64encode(var.user-data)}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.InstanceImageOCID}"
  }
}

resource "oci_core_instance" "WordpressA" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[0],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "WordpressA"
  shape               = "${var.InstanceShape}"
  subnet_id           = "${oci_core_subnet.WBA2.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
#  hostname_label      = "WordpressA"

#use this to install httpd role
  metadata {
  ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(var.user-data)}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.InstanceImageOCID2}"
  }
}

resource "oci_core_instance" "WordpressB" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "WordpressB"
  shape               = "${var.InstanceShape}"
  subnet_id           = "${oci_core_subnet.WBB2.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
#  hostname_label      = "WordpressB"

#use this to install httpd role
  metadata {
    ssh_authorized_keys = "${var.ssh_public_key}"
    user_data = "${base64encode(var.user-data)}"
  }
  source_details {
    source_type = "image"
    source_id   = "${var.InstanceImageOCID2}"
  }
}

