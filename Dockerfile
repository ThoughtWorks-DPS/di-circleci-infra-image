FROM twdps/di-circleci-base-image:stable

LABEL maintainers=<nic.cheneweth@thoughtworks.com>

ENV TERRAFORM_VERSION=0.12.26
ENV TERRAFORM_SHA256SUM=607bc802b1c6c2a5e62cc48640f38aaa64bef1501b46f0ae4829feb51594b257
ENV TFLINT_VERSION=0.16.1
ENV AWS_IAM_AUTHENTICATOR_VERSION=1.16.8
ENV AWS_IAM_AUTHENTICATOR_RELEASE_DATE=2020-04-16
ENV KUBECTL_VERSION=1.18.3
ENV HELM_VERSION=3.2.1
ENV SONOBUOY_VERSION=0.18.2
ENV ISTIO_VERSION=1.5.4
ENV VAULT_VERSION=1.4.2
ENV VAULT_SHA256SUM=f2bca89cbffb8710265eb03bc9452cc316b03338c411ba8453ffe7419390b8f1

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# sudo since twdps circleci remote docker images set the USER=cirlceci
# hadolint ignore=DL3004
RUN sudo apk add --no-cache \
             go==1.13.10-r0 \
             python3==3.8.3-r0 && \
    sudo apk add --no-cache --virtual build-dependencies \
             build-base==0.5-r2 \
             openssl-dev==1.1.1g-r0 \
             python3-dev==3.8.3-r0 \
             libffi-dev==3.3-r2 \
             g++==9.2.0-r4 \
             gcc==9.2.0-r4 \
             make==4.3-r0 && \
    sudo python3 -m ensurepip && \
    sudo rm -r /usr/lib/python*/ensurepip && \
    sudo pip3 install --upgrade pip==20.1.1 && \
    if [ ! -e /usr/bin/pip ]; then sudo ln -s pip3 /usr/bin/pip ; fi && \
    sudo ln -s pydoc3 pydoc && \
    sudo ln -s python3 python && \
    sudo ln -s python3-config python-config && \
    sudo pip install \
             setuptools==41.2.0 \
             awscli==1.18.71 \
             invoke==1.4.1 \
             hvac==0.10.3 \
             requests==2.23.0 \
             jinja2==2.11.2 \
             docker-compose==1.25.5 \
             pylint==2.5.2 \
             yamllint==1.23.0 && \
    curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sha256sum -cs "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sudo unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/bin && \
    sudo rm -f "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    curl -SLO "https://github.com/wata727/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" > tflint_linux_amd64.zip && \
    sudo unzip tflint_linux_amd64.zip -d /usr/bin && \
    sudo rm tflint_linux_amd64.zip && \
    curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/${AWS_IAM_AUTHENTICATOR_VERSION}/${AWS_IAM_AUTHENTICATOR_RELEASE_DATE}/bin/linux/amd64/aws-iam-authenticator && \
    curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/${AWS_IAM_AUTHENTICATOR_VERSION}/${AWS_IAM_AUTHENTICATOR_RELEASE_DATE}/bin/linux/amd64/aws-iam-authenticator.sha256 && \
    sudo openssl sha1 -sha256 aws-iam-authenticator && sudo rm aws-iam-authenticator.sha256 && \
    sudo chmod +x ./aws-iam-authenticator && \
    sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator && \
    curl -SLO "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" && \
    sudo chmod +x ./kubectl  && \
    sudo mv ./kubectl /usr/local/bin/kubectl && \
    curl -SLO "https://github.com/vmware-tanzu/sonobuoy/releases/download/v${SONOBUOY_VERSION}/sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    sudo tar -xf "sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    sudo mv sonobuoy /usr/local/bin/sonobuoy && \
    sudo rm "sonobuoy_${SONOBUOY_VERSION}_linux_amd64.tar.gz" && \
    curl -SLO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    sudo tar -xf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    sudo mv linux-amd64/helm /usr/bin && \
    sudo rm -rf linux-amd64/ && \
    sudo rm -rf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" && \
    curl -L https://git.io/getLatestIstio  | ISTIO_VERSION="${ISTIO_VERSION}" sh - && \
    sudo mv "istio-${ISTIO_VERSION}/bin/istioctl" /usr/bin/istioctl && \
    sudo rm -rf "istio-${ISTIO_VERSION}" && \
    curl -SLO "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip" > "vault_${VAULT_VERSION}_linux_amd64.zip" && \
    echo "${VAULT_SHA256SUM}  vault_${VAULT_VERSION}_linux_amd64.zip" > "vault_${VAULT_VERSION}_SHA256SUMS" && \
    sudo sha256sum -cs "vault_${VAULT_VERSION}_SHA256SUMS" && \
    sudo unzip "vault_${VAULT_VERSION}_linux_amd64.zip" -d /usr/local/bin && \
    sudo rm -f "vault_${VAULT_VERSION}_linux_amd64.zip" && \
    sudo apk del build-dependencies

USER circleci

HEALTHCHECK NONE
