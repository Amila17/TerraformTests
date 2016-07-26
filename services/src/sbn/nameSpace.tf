resource "azurerm_resource_group" "resourceGroup" {
    name     = "${data.template_file.resourceGroupName.rendered}"
    location = "${var.location}"
}

resource "azurerm_template_deployment" "serviceBus" {
    name                = "${data.template_file.serviceBusName.rendered}"
    resource_group_name = "${azurerm_resource_group.resourceGroup.name}"

    parameters = {
      serviceBusLocation      = "${var.location}"
      serviceBusNamespaceName = "${data.template_file.serviceBusName.rendered}"
      serviceBusSku           = "Standard"
      serviceBusApiVersion    = "2015-08-01"
    }

    template_body = <<TEMPLATEDEPLOY
{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "serviceBusLocation": {
            "type": "string"
        },
        "serviceBusNamespaceName": {
            "type": "string",
            "metadata": {
                "description": "Name of the Service Bus namespace"
            }
        },
        "serviceBusSku": {
            "type": "string",
            "allowedValues": [
                "Basic",
                "Standard"
            ],
            "defaultValue": "Standard",
            "metadata": {
                "description": "The messaging tier for service Bus namespace"
            }
        },
        "serviceBusApiVersion": {
            "type": "string",
            "defaultValue": "2015-08-01",
            "metadata": {
                "description": "Service Bus ApiVersion used by the template"
            }
        }
    },
    "variables": {
        "location": "[parameters('serviceBusLocation')]",
        "defaultSASKeyName": "RootManageSharedAccessKey",
        "defaultAuthRuleResourceId": "[resourceId('Microsoft.ServiceBus/namespaces/authorizationRules', parameters('serviceBusNamespaceName'), variables('defaultSASKeyName'))]"
    },
    "resources": [{
        "apiVersion": "[parameters('serviceBusApiVersion')]",
        "name": "[parameters('serviceBusNamespaceName')]",
        "type": "Microsoft.ServiceBus/namespaces",
        "location": "[variables('location')]",
        "properties": {}
    }],
    "outputs": {
        "serviceBusNamespaceComplete": {
            "type": "string",
            "value": "complete"
        },
        "NamespaceDefaultConnectionString": {
            "type": "string",
            "value": "[listkeys(variables('defaultAuthRuleResourceId'), parameters('serviceBusApiVersion')).primaryConnectionString]"
        },
        "DefaultSharedAccessPolicyPrimaryKey": {
            "type": "string",
            "value": "[listkeys(variables('defaultAuthRuleResourceId'), parameters('serviceBusApiVersion')).primaryKey]"
        }
    }
}
TEMPLATEDEPLOY
    deployment_mode = "Incremental"
}
