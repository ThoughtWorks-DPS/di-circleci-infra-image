#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-edge apk -v info"
  [[ "${output}" =~ "go-1.15.7-r0" ]]
  [[ "${output}" =~ "python3-3.8.7-r1" ]]
  [[ "${output}" =~ "ruby-2.7.2-r3" ]]
  [[ "${output}" =~ "ruby-webrick-2.7.2-r3" ]]
  [[ "${output}" =~ "ruby-bigdecimal-2.7.2-r3" ]]
  [[ "${output}" =~ "ruby-bundler-2.2.2-r0" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"21.0.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"53.1.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.19.16\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.5.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.8\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.25.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"2.11.2\"}" ]]
  [[ "${output}" =~ "{\"name\": \"docker-compose\", \"version\": \"1.27.4\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.6.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.25.0\"}" ]]
}


@test "evaluate installed gems" {
  run bash -c "docker exec di-circleci-infra-image-edge gem list"
  [[ "${output}" =~ "awspec" ]]
  [[ "${output}" =~ "json" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-edge terraform version"
  [[ "${output}" =~ "0.14.7" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-edge tflint --version"
  [[ "${output}" =~ "0.24.1" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-edge kubectl version --client=true"
  [[ "${output}" =~ "1.20.3" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-edge helm version"
  [[ "${output}" =~ "3.5.2" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-edge sonobuoy version"
  [[ "${output}" =~ "0.20.0" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.8.3" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-edge vault version"
  [[ "${output}" =~ "1.6.3" ]]
}
