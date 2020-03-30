# AWS HTTPS, HTTP,ET TCP health check

Terraform module which creates health check and alarm

Available through the [Terraform registry](https://registry.terraform.io/modules/Nuagic/route53-health-check/aws).

<<<<<<< HEAD
## Usage
=======
## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform011` branch.

## Usage terraform 0.12
>>>>>>> 217f1a7... Improve Readme

```hcl
resource "aws_sns_topic" "alarms" {
  name = "alarms"
  display_name = "alarms"
}

module "health_check-google" {
  version           = "2.0.1"
  source            = "Nuagic/route53-health-check/aws"
  fqdn              = "www.google.com"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"
  sns_topic         = aws_sns_topic.alarms.id
  name              = "Google alarm"
}
```

## Usage terraform 0.11

```hcl
resource "aws_sns_topic" "alarms" {
  name = "alarms"
  display_name = "alarms"
}

module "health_check-google" {
  version           = "1.0.3"
  source            = "Nuagic/route53-health-check/aws"
  fqdn              = "www.google.com"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"
  sns_topic         = "${aws_sns_topic.alarms.id}"
  name              = "Google alarm"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| failure\_threshold | The number of consecutive health checks that an endpoint must pass or fail. | string | n/a | yes |
| fqdn | The fully qualified domain name of the endpoint to be checked | string | `"false"` | no |
| name | The name of the check | string | `"false"` | no |
| port | The port of the endpoint to be checked | string | `"false"` | no |
| request\_interval | The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request. | string | n/a | yes |
| resource\_path | The path that you want Amazon Route 53 to request when performing health checks. | string | `"false"` | no |
| sns\_topic | SNS topic where publish alert | string | n/a | yes |
| type | The protocol to use when performing health checks. Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED and CLOUDWATCH_METRIC | string | n/a | yes |

## Authors

Module managed by [Cyril FERAUDET](https://github.com/Nuagic).

## License

Apache 2 Licensed. See LICENSE for full details.
