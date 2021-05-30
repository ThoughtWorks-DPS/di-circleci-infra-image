FROM twdps/di-circleci-base-image:1.28.0

LABEL maintainers=<nic.cheneweth@thoughtworks.com>

ENV TERRAFORM_VERSION=0.15.4
ENV TERRAFORM_SHA256SUM=ddf9b409599b8c3b44d4e7c080da9a106befc1ff9e53b57364622720114e325c
ENV TFLINT_VERSION=0.28.1
ENV KUBECTL_VERSION=1.21.1
ENV HELM_VERSION=3.6.0
ENV SONOBUOY_VERSION=0.50.0
ENV ISTIO_VERSION=1.10.0
ENV CONSUL_VERSION=1.9.5
ENV CONSUL_SHA256SUM=76e46d6711c92ffe573710345dc8c996605822eb6dbb371f895f011cda260035
ENV VAULT_VERSION=1.7.2
ENV VAULT_SHA256SUM=5ee6bb8119b55c27cd3864c982177714a0a4a3813927ccafdb262e78e4bb67bc

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# sudo since twdps circleci remote docker images set the USER=cirlceci
# hadolint ignore=DL3004
RUN sudo apk add --no-cache \
             go==1.15.12-r0\
             python3==3.8.10-r0 \
             rust==1.47.0-r2 \
             ruby==2.7.3-r0 \
             ruby-webrick==2.7.3-r0 \
             ruby-bigdecimal==2.7.3-r0 \
             ruby-bundler==2.2.2-r0 && \
    sudo apk add --no-cache --virtual build-dependencies \
             build-base==0.5-r2 \
             openssl-dev==1.1.1k-r0 \
             python3-dev==3.8.10-r0 \
             cargo==1.47.0-r2 \
             ruby==2.7.3-r0 \
             ruby-dev==2.7.3-r0 \
             libffi-dev==3.3-r2 \
             g++==10.2.1_pre1-r3 \
             gcc==10.2.1_pre1-r3 \
             make==4.3-r0 && \
    sudo python3 -m ensurepip && \
    sudo rm -r /usr/lib/python*/ensurepip && \
    sudo pip3 install --upgrade pip==21.1.2 && \
    if [ ! -e /usr/bin/pip ]; then sudo ln -s /usr/bin/pip3 /usr/bin/pip ; fi && \
    sudo ln -s /usr/bin/pydoc3 /usr/bin/pydoc && \
    sudo ln -s /usr/bin/python3 /usr/bin/python && \
    sudo ln -s /usr/bin/python3-config /usr/bin/python-config && \
    sudo pip install \
             setuptools==57.0.0 \
             awscli==1.19.84 \
             invoke==1.5.0 \
             hvac==0.10.14 \
             docker-compose==1.29.2 \
             requests==2.25.1 \
             jinja2==3.0.1 \
             pylint==2.8.2 \
             yamllint==1.26.1 && \
    sudo sh -c "echo 'gem: --no-document' > /etc/gemrc" && \
    sudo gem install \
             awspec:1.24.1 \
             inspec-bin:4.37.20 \
             json:2.5.1 && \
    curl -SLO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sha256sum -cs "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && sudo rm "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sudo unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin && \
    sudo rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip" > "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    echo "${CONSUL_SHA256SUM}  consul_${CONSUL_VERSION}_linux_amd64.zip" > "consul_${CONSUL_VERSION}_SHA256SUMS" && \
    sha256sum -cs "consul_${CONSUL_VERSION}_SHA256SUMS" && sudo rm "consul_${CONSUL_VERSION}_SHA256SUMS" && \
    sudo unzip "consul_${CONSUL_VERSION}_linux_amd64.zip" -d /usr/local/bin && \
    sudo rm -f "consul_${CONSUL_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    sudo chmod +x ./kubectl  && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    curl -SLO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    sudo tar -xf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    sudo mv linux-amd64/helm /usr/local/bin && \
    sudo rm -rf linux-amd64/ && \
    sudo rm "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    curl -SLO "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" > "vault_${VAULT_VERSION}_linux_amd64.zip" && \
    echo "${VAULT_SHA256SUM}  vault_${VAULT_VERSION}_linux_amd64.zip" > "vault_${VAULT_VERSION}_SHA256SUMS" && \
    sudo sha256sum -cs "vault_${VAULT_VERSION}_SHA256SUMS" && sudo rm "vault_${VAULT_VERSION}_SHA256SUMS" && \
    sudo unzip "vault_${VAULT_VERSION}_linux_amd64.zip" -d /usr/local/bin && \
    sudo rm "vault_${VAULT_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" > tflint_linux_amd64.zip && \
    sudo unzip tflint_linux_amd64.zip -d /usr/local/bin && \
    sudo rm tflint_linux_amd64.zip  && \
    curl -SLO "https://github.com/vmware-tanzu/sonobuoy/releases/download/v${SONOBUOY_VERSION}/sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    sudo tar -xf "sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    sudo mv sonobuoy /usr/local/bin/sonobuoy && \
    sudo rm "sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && sudo rm LICENSE && \
    curl -L https://istio.io/downloadIstio  | ISTIO_VERSION="${ISTIO_VERSION}" sh - && \
    sudo mv "istio-${ISTIO_VERSION}/bin/istioctl" /usr/local/bin/istioctl && \
    sudo rm -rf "istio-${ISTIO_VERSION}" && \
    sudo apk del build-dependencies

COPY inspec /etc/chef/accepted_licenses/inspec

USER circleci

HEALTHCHECK NONE

# new inspec install option
# curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
