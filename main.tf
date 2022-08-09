resource "aws_msk_configuration" "my_msk_config" {
    kafka_versions = var.kafka_version
    name = "msk-config"

    server_properties = <<PROPERTIES
auto.create.topics.enable = true
delete.topics.enable = true
PROPERTIES
}

resource "aws_msk_cluster" "msk_cluster" {
    cluster_name = var.cluster_name
    kafka_version = var.kafka_version
    number_of_broker_nodes = var.number_of_broker_nodes
    enhanced_monitoring = var.enhanced_monitoring

    broker_node_group_info {
        instance_type = var.msk_instance_type
        client_subnets = ["${data.aws_subnet.subnetname1.id}", "${data.aws_subnet.subnetname2.id}"]
        
        storage_info {
          ebs_storage_info {
            volume_size = var.msk_ebs_volume_size
      }
    }   
    }

    configuration_info {
    arn      = aws_msk_configuration.my_msk_config.arn
    revision = aws_msk_configuration.my_msk_config.latest_revision
  }

}

resource "aws_msk_scram_secret_association" "example" {
  cluster_arn     = aws_msk_cluster.msk_cluster.arn
  secret_arn_list = [aws_secretsmanager_secret.example.arn]

  depends_on = [aws_secretsmanager_secret_version.example]
}