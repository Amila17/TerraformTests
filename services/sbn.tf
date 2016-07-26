module "sbn" {
    source                    = "./src/sbn"

    servicePrefix             = "${data.template_file.servicePrefix.rendered}"
    location                  = "North Europe"
    resourceGroupNameSuffix   = "${data.terraform_remote_state.globalState.resourceGroupNameSuffix}"
    serviceBusNameSuffix      = "${data.terraform_remote_state.globalState.serviceBusNameSuffix}"

}
output "sbn_serviceBusNamespaceName"             { value = "${module.sbn.serviceBusNamespaceName}" }
output "sbn_namespaceDefaultConnectionString"    { value = "${module.sbn.namespaceDefaultConnectionString}" }
output "sbn_defaultSharedAccessPolicyPrimaryKey" { value = "${module.sbn.defaultSharedAccessPolicyPrimaryKey}" }
output "sbn_serviceBusNamespaceComplete"         { value = "${module.sbn.serviceBusNamespaceComplete}" }
