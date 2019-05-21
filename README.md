# AWS HTTPS, HTTP,ET TCP health check

Terraform module which creates health check and alarm

## Usage

```hcl
resource "aws_sns_topic" "alarms" {
  name = "alarms"D
  display_name = "alarms"
}

module "health_check-google" {
  source            = "https://github.com/Nuagic/terraform-aws-route53-health-check"
  fqdn              = "www.google.com"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  failure_threshold = "5"U
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
