output "serviceBusNamespaceComplete" {
    value = "${azurerm_template_deployment.serviceBus.outputs.serviceBusNamespaceComplete}"
}

output "serviceBusNamespaceName" {
    value = "${data.template_file.serviceBusName.rendered}"
}

output "namespaceDefaultConnectionString" {
    value = "${azurerm_template_deployment.serviceBus.outputs.NamespaceDefaultConnectionString}"
}

output "defaultSharedAccessPolicyPrimaryKey" {
    value = "${azurerm_template_deployment.serviceBus.outputs.DefaultSharedAccessPolicyPrimaryKey}"
}
