FROM twdps/di-circleci-base-image:stable

LABEL maintainers=<nic.cheneweth@thoughtworks.com>

ENV TERRAFORM_VERSION=0.13.3
ENV TERRAFORM_SHA256SUM=35c662be9d32d38815cde5fa4c9fa61a3b7f39952ecd50ebf92fd1b2ddd6109b
ENV TFLINT_VERSION=0.20.2
ENV KUBECTL_VERSION=1.19.2
ENV HELM_VERSION=3.3.4
ENV SONOBUOY_VERSION=0.19.0
ENV ISTIO_VERSION=1.7.2
ENV CONSUL_VERSION=1.8.4
ENV CONSUL_SHA256SUM=0d74525ee101254f1cca436356e8aee51247d460b56fc2b4f7faef8a6853141f
ENV VAULT_VERSION=1.5.4
ENV VAULT_SHA256SUM=50156e687b25b253a63c83b649184c79a1311f862c36f4ba16fd020ece4ed3b3

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# sudo since twdps circleci remote docker images set the USER=cirlceci
# hadolint ignore=DL3004
RUN sudo apk add --no-cache \
             go==1.13.14-r0 \
             python3==3.8.5-r0 \
             ruby==2.7.1-r3 \
             ruby-webrick==2.7.1-r3 \
             ruby-bigdecimal==2.7.1-r3 \
             ruby-bundler==2.1.4-r1 && \
    sudo apk add --no-cache --virtual build-dependencies \
             build-base==0.5-r2 \
             openssl-dev==1.1.1g-r0 \
             python3-dev==3.8.5-r0 \
             ruby-dev==2.7.1-r3 \
             libffi-dev==3.3-r2 \
             g++==9.3.0-r2 \
             gcc==9.3.0-r2 \
             make==4.3-r0 && \
    sudo python3 -m ensurepip && \
    sudo rm -r /usr/lib/python*/ensurepip && \
    sudo pip3 install --upgrade pip==20.2.3 && \
    if [ ! -e /usr/bin/pip ]; then sudo ln -s /usr/bin/pip3 /usr/bin/pip ; fi && \
    sudo ln -s /usr/bin/pydoc3 /usr/bin/pydoc && \
    sudo ln -s /usr/bin/python3 /usr/bin/python && \
    sudo ln -s /usr/bin/python3-config /usr/bin/python-config && \
    sudo pip install \
             setuptools==50.3.0 \
             awscli==1.18.146 \
             invoke==1.4.1 \
             hvac==0.10.5 \
             requests==2.24.0 \
             jinja2==2.11.2 \
             docker-compose==1.27.4 \
             pylint==2.6.0 \
             yamllint==1.24.2 && \
    sudo sh -c "echo "gem: --no-document" > /etc/gemrc" && \
    sudo gem install \
             awspec:1.22.0 \
             json:2.3.1 && \
    curl -SLO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sha256sum -cs "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && sudo rm "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sudo unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/bin && \
    sudo rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" > "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    echo "${CONSUL_SHA256SUM}  consul_${CONSUL_VERSION}_linux_amd64.zip" > "consul_${CONSUL_VERSION}_SHA256SUMS" && \
    sha256sum -cs "consul_${CONSUL_VERSION}_SHA256SUMS" && sudo rm "consul_${CONSUL_VERSION}_SHA256SUMS" && \
    sudo unzip "consul_${CONSUL_VERSION}_linux_amd64.zip" -d /usr/bin && \
    sudo rm -f "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    sudo chmod +x ./kubectl  && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    curl -SLO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    sudo tar -xf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    sudo mv linux-amd64/helm /usr/bin && \
    sudo rm -rf linux-amd64/ && \
    sudo rm "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    curl -SLO "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" > "vault_${VAULT_VERSION}_linux_amd64.zip" && \
    echo "${VAULT_SHA256SUM}  vault_${VAULT_VERSION}_linux_amd64.zip" > "vault_${VAULT_VERSION}_SHA256SUMS" && \
    sudo sha256sum -cs "vault_${VAULT_VERSION}_SHA256SUMS" && sudo rm "vault_${VAULT_VERSION}_SHA256SUMS" && \
    sudo unzip "vault_${VAULT_VERSION}_linux_amd64.zip" -d /usr/local/bin && \
    sudo rm "vault_${VAULT_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" > tflint_linux_amd64.zip && \
    sudo unzip tflint_linux_amd64.zip -d /usr/bin && \
    sudo rm tflint_linux_amd64.zip  && \
    sudo apk del build-dependencies

# RUN sudo curl -SLO "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" > tflint_linux_amd64.zip && \
#     sudo unzip tflint_linux_amd64.zip -d /usr/bin && \
#     sudo rm tflint_linux_amd64.zip
    # curl -SLO "https://github.com/vmware-tanzu/sonobuoy/releases/download/v${SONOBUOY_VERSION}/sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    # sudo tar -xf "sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    # sudo mv sonobuoy /usr/local/bin/sonobuoy && \
    # sudo rm "sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && sudo rm LICENSE && \
    # curl -L https://istio.io/downloadIstio  | ISTIO_VERSION='${ISTIO_VERSION}' sh - && \
    # sudo mv "istio-${ISTIO_VERSION}/bin/istioctl" /usr/bin/istioctl && \
    # sudo rm -rf "istio-${ISTIO_VERSION}" && \
# sudo wget "https://github.com/terraform-linters/tflint/releases/download/v0.20.2/tflint_linux_amd64.zip" > tflint_linux_amd64.zip
USER circleci

HEALTHCHECK NONE
