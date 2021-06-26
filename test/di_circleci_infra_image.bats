#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-edge apk -v info"
  [[ "${output}" =~ "go-1.16.5-r0" ]]
  [[ "${output}" =~ "python3-3.9.5-r1" ]]
  [[ "${output}" =~ "rust-1.52.0-r0" ]]
  [[ "${output}" =~ "ruby-2.7.3-r1" ]]
  [[ "${output}" =~ "ruby-webrick-2.7.3-r1" ]]
  [[ "${output}" =~ "ruby-bigdecimal-2.7.3-r1" ]]
  [[ "${output}" =~ "ruby-bundler-2.2.20-r0" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"21.1.3\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"57.0.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.19.100\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.5.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.14\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.25.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"3.0.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.8.3\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.26.1\"}" ]]
}

@test "evaluate installed gems" {
  run bash -c "docker exec di-circleci-infra-image-edge gem list"
  [[ "${output}" =~ "awspec (1.24.1)" ]]
  [[ "${output}" =~ "inspec-bin (4.37.30)" ]]
  [[ "${output}" =~ "json (2.5.1)" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-edge terraform version"
  [[ "${output}" =~ "1.0.1" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-edge tflint --version"
  [[ "${output}" =~ "0.29.1" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-edge kubectl version --client=true"
  [[ "${output}" =~ "1.21.1" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-edge helm version"
  [[ "${output}" =~ "3.6.1" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-edge sonobuoy version"
  [[ "${output}" =~ "0.52.0" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.10.2" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-edge vault version"
  [[ "${output}" =~ "1.7.3" ]]
}

@test "docker-compose version" {
  run bash -c "docker exec di-circleci-infra-image-edge docker-compose --version"
  [[ "${output}" =~ "1.29.2" ]]
}
