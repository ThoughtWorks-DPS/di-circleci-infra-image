#!/usr/bin/env bats

@test "evaluate installed package versions" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge apk -v info"
  [[ "${output}" =~ "go-1.16.5-r0" ]]
  [[ "${output}" =~ "python3-3.9.5-r1" ]]
  [[ "${output}" =~ "rust-1.52.0-r0" ]]
  [[ "${output}" =~ "ruby-2.7.3-r1" ]]
  [[ "${output}" =~ "ruby-webrick-2.7.3-r1" ]]
  [[ "${output}" =~ "ruby-bigdecimal-2.7.3-r1" ]]
  [[ "${output}" =~ "ruby-bundler-2.2.20-r0" ]]
}

@test "go version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge go version"
  [[ "${output}" =~ "1.16.5" ]]
}

@test "python3 version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge python -V"
  [[ "${output}" =~ "3.9.5" ]]
}

@test "rust version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge rustc --version"
  [[ "${output}" =~ "1.52.0" ]]
}

@test "ruby version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge ruby -v"
  [[ "${output}" =~ "2.7.3" ]]
}

@test "evaluate installed pip packages and versions" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge pip list --format json"
  [[ "${output}" =~ "{\"name\": \"pip\", \"version\": \"21.1.3\"}" ]]
  [[ "${output}" =~ "{\"name\": \"setuptools\", \"version\": \"56.0.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"awscli\", \"version\": \"1.19.105\"}" ]]
  [[ "${output}" =~ "{\"name\": \"invoke\", \"version\": \"1.5.0\"}" ]]
  [[ "${output}" =~ "{\"name\": \"hvac\", \"version\": \"0.10.14\"}" ]]
  [[ "${output}" =~ "{\"name\": \"requests\", \"version\": \"2.25.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"Jinja2\", \"version\": \"3.0.1\"}" ]]
  [[ "${output}" =~ "{\"name\": \"pylint\", \"version\": \"2.8.3\"}" ]]
  [[ "${output}" =~ "{\"name\": \"yamllint\", \"version\": \"1.26.1\"}" ]]
}

@test "pip version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge pip -V"
  [[ "${output}" =~ "21.1.3" ]]
}

@test "awscli version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge aws --version"
  [[ "${output}" =~ "1.19.105" ]]
}

@test "invoke version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge invoke -V"
  [[ "${output}" =~ "1.5.0" ]]
}

@test "awspec version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge awspec -v"
  [[ "${output}" =~ "1.24.2" ]]
}

@test "inspec version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge inspec -v"
  [[ "${output}" =~ "4.38.3" ]]
}

@test "terraform version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge terraform version"
  [[ "${output}" =~ "1.0.2" ]]
}

@test "tflint version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge tflint --version"
  [[ "${output}" =~ "0.29.1" ]]
}

@test "kubectl version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge kubectl version --client=true"
  [[ "${output}" =~ "1.21.1" ]]
}

@test "helm version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge helm version"
  [[ "${output}" =~ "3.6.1" ]]
}

@test "sonobuoy version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge sonobuoy version"
  [[ "${output}" =~ "0.52.0" ]]
}

@test "istioctl version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge istioctl version --remote=false"
  [[ "${output}" =~ "1.10.2" ]]
}

@test "vault version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge vault version"
  [[ "${output}" =~ "1.7.3" ]]
}

@test "docker-compose version" {
  run bash -c "docker exec di-circleci-infra-image-alpine-edge docker-compose --version"
  [[ "${output}" =~ "1.29.2" ]]
}
