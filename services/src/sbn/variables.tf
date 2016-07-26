
variable "location"                  { }
variable "serviceBusNameSuffix"      { }
variable "resourceGroupNameSuffix"   { }
variable "servicePrefix"             { }

data "template_file" "resourceGroupName" {
    template = "${var.servicePrefix}${var.serviceBusNameSuffix}${var.resourceGroupNameSuffix}"
}

data "template_file" "serviceBusName" {
    template = "${var.servicePrefix}${var.serviceBusNameSuffix}"
}
