#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-edge apk -v info"
  [[ "${output}" =~ "go-1.13.14-r0" ]]
  [[ "${output}" =~ "python3-3.8.5-r0" ]]
  [[ "${output}" =~ "ruby-2.7.1-r3" ]]
  [[ "${output}" =~ "ruby-webrick-2.7.1-r3" ]]
  [[ "${output}" =~ "ruby-bigdecimal-2.7.1-r3" ]]
  [[ "${output}" =~ "ruby-bundler-2.1.4-r1" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"20.2.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"49.6.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.18.124\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.4.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.5\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.24.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"2.11.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"docker-compose\", \"version\": \"1.26.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.6.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.24.2\"}" ]]
}

@test "evaluate installed gems" {
  run bash -c "docker exec di-circleci-infra-image-edge gem list"
  [[ "${output}" =~ "awspec" ]]
  [[ "${output}" =~ "json" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-edge terraform version"
  [[ "${output}" =~ "0.13.0" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-edge tflint --version"
  [[ "${output}" =~ "0.19.0" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-edge kubectl version --client=true"
  [[ "${output}" =~ "1.18.8" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-edge helm version"
  [[ "${output}" =~ "3.3.0" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-edge sonobuoy version"
  [[ "${output}" =~ "0.18.4" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.7.0" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-edge vault version"
  [[ "${output}" =~ "1.5.2" ]]
}
