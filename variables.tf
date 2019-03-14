variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "compartment_ocid" {}
variable "ssh_public_key" {}
variable "ssh_private_key" {}

#defines the CIDR blocks for the entire VCN and for the subnets
variable "vcn_cidr" {
    default = "10.0.0.0/16"
}
variable "availability_domain" {
  default = 1
}
variable "LBA_subnet_cidr" {
    default = "10.0.0.0/24"
}

variable "LBB_subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "WBA_subnet_cidr" {
    default = "10.0.2.0/24"
}

variable "WBB_subnet_cidr" {
    default = "10.0.3.0/24"
}

variable "DBA_subnet_cidr" {
    default = "10.0.4.0/24"
}



variable "LBA2_subnet_cidr" {
    default = "10.0.5.0/24"
}

variable "LBB2_subnet_cidr" {
    default = "10.0.6.0/24"
}

variable "WBA2_subnet_cidr" {
    default = "10.0.7.0/24"
}

variable "WBB2_subnet_cidr" {
    default = "10.0.8.0/24"
}

variable "DBA2_subnet_cidr" {
    default = "10.0.9.0/24"
}

#variable "tag_namespace_description" {}
#variable "tag_namespace_name" {}
#variable "oci_indentity_tag_namespace" {}

#define the shape of the instance to be deployed
variable "InstanceShape" {
    default = "VM.Standard2.1"
}

variable "InstanceShapeBMGPU" {
    default = "VM.Standard2.1"
}

#define the OCID of the image to be deployed, see https://docs.us-phoenix-1.oraclecloud.com/images/ --- add just for the region used
variable "InstanceImageOCID" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa4ajophxsobnchfbaex3xbf4f6rx6b74w2rck3q4rbcnnfafnbz5q"
}

variable "InstanceImageOCID2" {
    default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaeivw2ah4xngsxmrqe72v2lolbygbes2dpmzmj4m53ndphomitdfa"
}

variable "user-data" {
  default = <<EOF
#!/bin/bash -x
echo '################### webserver userdata begins #####################'
touch ~opc/userdata.`date +%s`.start
# echo '########## yum update all ###############'
# yum update -y
echo '########## basic webserver ##############'
yum install -y httpd
systemctl enable  httpd.service
systemctl start  httpd.service
echo '<html><head></head><body><pre><code>' > /var/www/html/index.html
hostname >> /var/www/html/index.html
echo '' >> /var/www/html/index.html
cat /etc/os-release >> /var/www/html/index.html
echo '</code></pre></body></html>' >> /var/www/html/index.html
firewall-offline-cmd --add-service=http
systemctl enable  firewalld
systemctl restart  firewalld
touch ~opc/userdata.`date +%s`.finish
echo '################### webserver userdata ends #######################'
EOF
}



# DBSystem specific 
variable "db_system_shape" {
  default = "VM.Standard2.1"
}

variable "cpu_core_count" {
  default = "2"
}

variable "db_edition" {
  default = "ENTERPRISE_EDITION"
}

variable "db_admin_password" {
  default = "BEstrO0ng_#12"
}

variable "db_name" {
  default = "Dorindb"
}

variable "db_name1" {
  default = "Dorindb1"
}

variable "db_version" {
  default = "12.1.0.2"
}

variable "db_home_display_name" {
  default = "DBHome"
}

variable "db_home_display_name1" {
  default = "DBHome1"
}

variable "db_disk_redundancy" {
  default = "HIGH"
}

variable "db_system_display_name" {
  default = "DBSystem"
}

variable "db_system_display_name1" {
  default = "DBSystem1"
}

variable "hostname" {
  default = "myoracledb"
}

variable "hostname1" {
  default = "myoracledb1"
}

variable "host_user_name" {
  default = "opc"
}

variable "n_character_set" {
  default = "AL16UTF16"
}

variable "character_set" {
  default = "AL32UTF8"
}

variable "db_workload" {
  default = "OLTP"
}

variable "pdb_name" {
  default = "pdbName"
}

variable "data_storage_size_in_gb" {
  default = "256"
}

variable "license_model" {
  default = "LICENSE_INCLUDED"
}

variable "node_count" {
  default = "1"
}

variable "data_storage_percentage" {
  default = "40"
}
