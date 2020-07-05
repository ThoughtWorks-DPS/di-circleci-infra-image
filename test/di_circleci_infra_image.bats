#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-edge apk -v info"
  [[ "${output}" =~ "go-1.13.11-r0" ]]
  [[ "${output}" =~ "python3-3.8.3-r0" ]]
  [[ "${output}" =~ "ruby-2.7.1-r3" ]]
  [[ "${output}" =~ "ruby-webrick-2.7.1-r3" ]]
  [[ "${output}" =~ "ruby-bigdecimal-2.7.1-r3" ]]
  [[ "${output}" =~ "ruby-bundler-2.1.4-r1" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"20.1.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"47.3.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.18.93\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.4.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.4\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.24.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"2.11.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"docker-compose\", \"version\": \"1.26.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.5.3\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.23.0\"}" ]]
}

@test "evaluate installed gems" {
  run bash -c "docker exec di-circleci-infra-image-edge gem list"
  [[ "${output}" =~ "awspec" ]]
  [[ "${output}" =~ "json" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-edge terraform version"
  [[ "${output}" =~ "0.12.28" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-edge tflint --version"
  [[ "${output}" =~ "0.16.2" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-edge kubectl version --client=true"
  [[ "${output}" =~ "1.18.5" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-edge helm version"
  [[ "${output}" =~ "3.2.4" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-edge sonobuoy version"
  [[ "${output}" =~ "0.18.3" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.6.3" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-edge vault version"
  [[ "${output}" =~ "1.4.2" ]]
}
