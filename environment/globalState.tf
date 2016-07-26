data "terraform_remote_state" "globalState" {
    backend = "consul"
    config {
        path         = "platform/test/infrastructure/global/state"
        address      = "10.36.0.70:8500"
        access_token = "anonymous"
    }
}
