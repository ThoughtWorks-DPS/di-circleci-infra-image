#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-edge apk -v info"
  [[ "${output}" =~ "go-1.13.10-r0" ]]
  [[ "${output}" =~ "python3-3.8.3-r0" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"20.1.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"41.2.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.18.71\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.4.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.3\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.23.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"2.11.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"docker-compose\", \"version\": \"1.25.5\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.5.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.23.0\"}" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-edge terraform version"
  [[ "${output}" =~ "0.12.26" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-edge tflint --version"
  [[ "${output}" =~ "0.16.1" ]]
}

@test "aws-iam-authenticator version" {
  run bash -c "docker exec di-circleci-infra-image-edge aws-iam-authenticator version"
  [[ "${output}" =~ "0.5.0" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-edge kubectl version --client=true"
  [[ "${output}" =~ "1.18.3" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-edge helm version"
  [[ "${output}" =~ "3.2.1" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-edge sonobuoy version"
  [[ "${output}" =~ "0.18.2" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.5.4" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-edge vault version"
  [[ "${output}" =~ "1.4.2" ]]
}
