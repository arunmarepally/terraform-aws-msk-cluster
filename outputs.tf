output "arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = aws_msk_cluster.msk_cluster.arn
}

output "configuration_arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = aws_msk_configuration.my_msk_config.arn
}

output "configuration_latest_revision" {
  description = "Latest revision of the configuration"
  value       = aws_msk_configuration.my_msk_config.latest_revision
}
