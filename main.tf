resource "aws_route53_health_check" "check" {
  for_each = var.sites

  fqdn              = each.key
  port              = each.value.port
  type              = each.value.type
  resource_path     = each.value.resource_path
  failure_threshold = each.value.failure_threshold
  request_interval  = each.value.request_interval
  search_string     = each.value.search_string

  tags = {
    Name = each.key
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  for_each = var.sites

  alarm_name          = each.key
  namespace           = "AWS/Route53"
  metric_name         = "HealthCheckStatus"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "1"
  unit                = "None"

  dimensions = {
    HealthCheckId = aws_route53_health_check.check[each.key].id
  }

  alarm_description         = "This metric monitors ${each.key} whether the service endpoint is up or not."
  ok_actions             = [var.sns_topic]
  alarm_actions             = [var.sns_topic]
  insufficient_data_actions = [var.sns_topic]
  treat_missing_data        = "breaching"
}
