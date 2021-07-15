## 07-014-2021 minor di-circleci-infra-image 3.0.1

Only change is gpg folder ownership.  

## 07-08-2021 slim release, major packge version upgrade in di-circleci-infra-image 3.0.0

^changes  

FROM twdps/di-circleci-base-image:alpine-2.1.1^  

| package          | version     |
|------------------|-------------|
| go               | 1.16.5-r0^  |
| python3          | 3.9.5-r1^   |
| rust             | 1.52.0-r0^  |
| ruby             | 2.7.3-r1^   |
| ruby-webrick     | 2.7.3-r1^   |
| ruby-bigdecimal  | 2.7.3-r1^   |
| ruby-bundler     | 2.2.2-r1^   |
| pip              | 21.1.3^     |
| setuptools       | 56.0.0^     |
| awscli           | 1.19.105^   |
| invoke           | 1.5.0       |
| hvac             | 0.10.14     |
| docker-compose   | 1.29.2      |
| requests         | 2.25.1      |
| jinja2           | 3.0.1       |
| pylint           | 2.8.3^      |
| yamllint         | 1.26.1      |
| awspec           | 1.24.2      |
| inspec-bin       | 4.38.3^     |
| json             | 2.5.1       |
| terraform        | 1.0.2^      |
| tflint           | 0.29.1^     |
| kubectl          | 1.21.1      |
| helm             | 3.6.1^      |
| sonobuoy         | 0.52.0^     |
| istio            | 1.10.2^     |
| consul           | 1.10.0^     |
| vault            | 1.7.3^      |

FROM twdps/di-circleci-base-image:slim-2.1.1^  

| package          | version     |
|------------------|-------------|
| go               | 1.16.5-r0^  |
| python3          | 3.9.2-r1^   |
| rust             | 1.53.0-r0^  |
| ruby-full        | 1:2.7+2^    |
| pip              | 20.3.4-2^   |
| setuptools       | 57.1.0      |
| awscli           | 1.19.105^   |
| invoke           | 1.5.0       |
| hvac             | 0.10.14     |
| docker-compose   | 1.29.2      |
| requests         | 2.25.1      |
| jinja2           | 3.0.1       |
| pylint           | 2.8.3^      |
| yamllint         | 1.26.1      |
| awspec           | 1.24.2      |
| inspec-bin       | 4.38.3^     |
| json             | 2.5.1       |
| terraform        | 1.0.2^      |
| tflint           | 0.29.1^     |
| kubectl          | 1.21.1      |
| helm             | 3.6.1^      |
| sonobuoy         | 0.52.0^     |
| istio            | 1.10.2^     |
| consul           | 1.10.0^     |
| vault            | 1.7.3^      |


## 05-29-2021 packge version included in di-circleci-infra-image:2.0.0

Major upgrade for jinja2

^changes

FROM twdps/di-circleci-base-image:1.28.0^

| package          | version     |
|------------------|-------------|
| go               | 1.15.12-r0  |
| python3          | 3.8.10-r0   |
| rust             | 1.47.0-r2   |
| ruby             | 2.7.3-r0    |
| ruby-webrick     | 2.7.3-r0    |
| ruby-bigdecimal  | 2.7.3-r0    |
| ruby-bundler     | 2.2.2-r0    |
| pip              | 21.1.2^     |
| setuptools       | 57.0.0^     |
| awscli           | 1.19.84^    |
| invoke           | 1.5.0       |
| hvac             | 0.10.14^    |
| docker-compose   | 1.29.2      |
| requests         | 2.25.1      |
| jinja2           | 3.0.1^      |
| pylint           | 2.8.2       |
| yamllint         | 1.26.1      |
| awspec           | 1.24.1      |
| inspec-bin       | 4.37.20^    |
| json             | 2.5.1       |
| teraform         | 0.15.4^     |
| tflint           | 0.28.1      |
| kubectl          | 1.21.1^     |
| helm             | 3.6.0       |
| sonobuoy         | 0.50.0^     |
| istio            | 1.10.0^     |
| consul           | 1.9.5       |
| vault            | 1.7.2^      |


## 05-11-2021 packge version included in di-circleci-infra-image:1.22.0

^changes

FROM twdps/di-circleci-base-image:1.27.0^

| package          | version     |
|------------------|-------------|
| go               | 1.15.12-r0^ |
| python3          | 3.8.10-r0^  |
| rust             | 1.47.0-r2   |
| ruby             | 2.7.3-r0    |
| ruby-webrick     | 2.7.3-r0    |
| ruby-bigdecimal  | 2.7.3-r0    |
| ruby-bundler     | 2.2.2-r0    |
| pip              | 21.1.1^     |
| setuptools       | 56.2.0^     |
| awscli           | 1.19.72^    |
| invoke           | 1.5.0       |
| hvac             | 0.10.11^    |
| docker-compose   | 1.29.2^     |
| requests         | 2.25.1      |
| jinja2           | 2.11.3      |
| pylint           | 2.8.2^      |
| yamllint         | 1.26.1      |
| awspec           | 1.24.1^     |
| inspec-bin       | 4.37.8^     |
| json             | 2.5.1       |
| teraform         | 0.15.3^     |
| tflint           | 0.28.1^     |
| kubectl          | 1.20.6      |
| helm             | 3.5.4       |
| sonobuoy         | 0.50.0^     |
| isito            | 1.9.5^      |
| consul           | 1.9.5       |
| vault            | 1.7.0       |

## 04-30-2021 packge version included in di-circleci-infra-image:1.19.0

| package          | version     |
|------------------|-------------|
| go               | 1.15.10-r0  |
| python3          | 3.8.8-r0    |
| rust             | 1.47.0-r2   |
| ruby             | 2.7.3-r0    |
| ruby-webrick     | 2.7.3-r0    |
| ruby-bigdecimal  | 2.7.3-r0    |
| ruby-bundler     | 2.2.2-r0    |
| pip              | 21.0.1      |
| setuptools       | 56.0.0      |
| awscli           | 1.19.61     |
| invoke           | 1.5.0       |
| hvac             | 0.10.9      |
| docker-compose   | 1.29.1      |
| requests         | 2.25.1      |
| jinja2           | 2.11.3      |
| pylint           | 2.7.4       |
| yamllint         | 1.26.1      |
| awspec           | 1.23.0      |
| inspec-bin       | 4.36.4      |
| json             | 2.5.1       |
| teraform         | 0.15.1      |
| tflint           | 0.26.0      |
| kubectl          | 1.20.6      |
| helm             | 3.5.4       |
| sonobuoy         | 0.20.0      |
| isito            | 1.9.4       |
| consul           | 1.9.5       |
| vault            | 1.7.0       |


## 03-09-2021 packge version included in di-circleci-infra-image:1.19.0

FROM twdps/di-circleci-base-image:stable

| package          | version     |
|------------------|-------------|
| go               | 1.15.7-r0   |
| python3          | 3.8.7-r1    |
| rust             | 1.47.0-r2   |
| ruby-webrick     | 2.7.2-r3    |
| ruby-bigdecimal  | 2.7.2-r3    |
| ruby-bundler     | 2.2.2-r0    |
| pip              | 21.0.1      |
| setuptools       | 53.1.0      |
| awscli           | 1.19.22     |
| invoke           | 1.5.0       |
| hvac             | 0.10.8      |
| docker-compose   | 1.28.5      |
| requests         | 2.25.1      |
| jinja2           | 2.11.3      |
| pylint           | 2.7.1       |
| yamllint         | 1.26.0      |
| awspec           | 1.22.1      |
| inspec-bin       | 4.26.13     |
| json             | 2.5.1       |
| teraform         | 0.14.7      |
| tflint           | 0.24.1      |
| kubectl          | 1.20.3      |
| helm             | 3.5.2       |
| sonobuoy         | 0.20.0      |
| isito            | 1.8.3       |
| consul           | 1.9.3       |
| vault            | 1.6.3       |
