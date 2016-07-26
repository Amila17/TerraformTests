data "terraform_remote_state" "environmentState" {
    backend = "consul"
    config {
        path         = "platform/test/infrastructure/environments/en1abcts01/state"
        address      = "10.36.0.70:8500"
        access_token = "anonymous"
    }
}
