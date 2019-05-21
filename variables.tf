variable "name" {
  default     = false
  description = "The name of the check"
}

variable "fqdn" {
  default     = false
  description = "The fully qualified domain name of the endpoint to be checked"
}

variable "port" {
  default     = false
  description = "The port of the endpoint to be checked"
}

variable "type" {
  description = "The protocol to use when performing health checks. Valid values are HTTP, HTTPS, HTTP_STR_MATCH, HTTPS_STR_MATCH, TCP, CALCULATED and CLOUDWATCH_METRIC"
}

variable "resource_path" {
  default     = false
  description = "The path that you want Amazon Route 53 to request when performing health checks."
}

variable "failure_threshold" {
  description = "The number of consecutive health checks that an endpoint must pass or fail."
}

variable "request_interval" {
  description = "The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request."
}

variable "sns_topic" {
  description = "SNS topic where publish alert"
}
