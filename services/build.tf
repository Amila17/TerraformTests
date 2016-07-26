data "template_file" "servicePrefix" {
    template = "${data.terraform_remote_state.environmentState.locationShortName}${data.terraform_remote_state.environmentState.clientShortName}${data.terraform_remote_state.environmentState.environmentShortName}"
}