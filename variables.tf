variable "sns_topic" {
  description = "SNS topic where publish alert"
}

variable "sites" {
  type = map(object({
    port = optional(number, 443)
    type = optional(string, "HTTPS")
    resource_path = optional(string, "/")
    failure_threshold = optional(number, 2)
    request_interval = optional(number, 30)
    search_string = optional(string, "")
  }))
}
