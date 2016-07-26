variable "location"             { default = "North Europe" }
variable "locationShortName"    { default = "en1" }
variable "clientShortName"      { default = "abc" }
variable "environmentShortName" { default = "ts01" }

data "template_file" "environmentName" {
    template = "${var.locationShortName}${var.clientShortName}${var.environmentShortName}"
}

output "location"               { value = "${var.location}" }
output "locationShortName"      { value = "${var.locationShortName}" }
output "clientShortName"        { value = "${var.clientShortName}" }
output "environmentShortName"   { value = "${var.environmentShortName}" }
output "environmentName"        { value = "${data.template_file.environmentName.rendered}" }
