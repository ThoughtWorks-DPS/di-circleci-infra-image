#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-edge apk -v info"
  [[ "${output}" =~ "go-1.15.12-r0" ]]
  [[ "${output}" =~ "python3-3.8.10-r0" ]]
  [[ "${output}" =~ "rust-1.47.0-r2" ]]
  [[ "${output}" =~ "ruby-2.7.3-r0" ]]
  [[ "${output}" =~ "ruby-webrick-2.7.3-r0" ]]
  [[ "${output}" =~ "ruby-bigdecimal-2.7.3-r0" ]]
  [[ "${output}" =~ "ruby-bundler-2.2.2-r0" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"21.1.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"57.0.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.19.84\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.5.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.14\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.25.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"3.0.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.8.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.26.1\"}" ]]
}

@test "evaluate installed gems" {
  run bash -c "docker exec di-circleci-infra-image-edge gem list"
  [[ "${output}" =~ "awspec" ]]
  [[ "${output}" =~ "inspec-bin" ]]
  [[ "${output}" =~ "json" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-edge terraform version"
  [[ "${output}" =~ "0.15.4" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-edge tflint --version"
  [[ "${output}" =~ "0.28.1" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-edge kubectl version --client=true"
  [[ "${output}" =~ "1.21.1" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-edge helm version"
  [[ "${output}" =~ "3.6.0" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-edge sonobuoy version"
  [[ "${output}" =~ "0.50.0" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.10.0" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-edge vault version"
  [[ "${output}" =~ "1.7.2" ]]
}

@test "docker-compose version" {
  run bash -c "docker exec di-circleci-infra-image-edge docker-compose --version"
  [[ "${output}" =~ "1.29.2" ]]
}
