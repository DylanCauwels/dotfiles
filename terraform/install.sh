#!/usr/bin/env bash
#
# Terraform
# https://www.terraform.io

# Shell Support
# shellcheck disable=SC1090
[[ -z "$SHELLSUPPORT" ]] && . "$( cd "${BASH_SOURCE%/*}/.." && pwd )/shell/support.sh"

if ! type "terraform" &> /dev/null; then
    sh_info "Installing Terraform..."
    if type "brew" &> /dev/null; then
        brew install terraform
    elif type "apt-get" &> /dev/null; then
        # sudo apt-get update
        sudo apt-get -y install terraform
    elif type "yum" &> /dev/null; then
        sudo yum install terraform
    fi
fi

if type "terraform" &> /dev/null; then
    sh_success "$(terraform --version) installed: $(command -v terraform)"
fi
