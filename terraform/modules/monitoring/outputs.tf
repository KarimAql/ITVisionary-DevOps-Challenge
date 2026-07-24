output "sns_topic_arn" {
  value = local.create_sns ? aws_sns_topic.alarms[0].arn : ""
}

output "cpu_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.ecs_cpu_high.arn
}

output "alb_5xx_alarm_arn" {
  value = aws_cloudwatch_metric_alarm.alb_5xx.arn
}
