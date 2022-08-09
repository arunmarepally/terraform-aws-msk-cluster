variable "kafka_version" {
  description = "Specify the desired Kafka version"
  type        = string
}

variable "cluster_name" {
    description = "Name of MSK cluster"
    type = string
}

variable "number_of_broker_nodes" {
    description = "The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets."
    type = number
}

variable "enhanced_monitoring" {
  description = "Specify the desired enhanced MSK CloudWatch monitoring level to one of three monitoring levels: DEFAULT, PER_BROKER, PER_TOPIC_PER_BROKER or PER_TOPIC_PER_PARTITION. See [Monitoring Amazon MSK with Amazon CloudWatch](https://docs.aws.amazon.com/msk/latest/developerguide/monitoring.html)."
  type        = string
  default     = "DEFAULT"
}

variable "msk_instance_type" {
  description = "Specify the instance type to use for the kafka brokers. e.g. kafka.m5.large."
  type        = string
}

variable "msk_ebs_volume_size" {
    description = "The size in GiB of the EBS volume for the data drive on each broker node."
    type = number
    default = "1000"
}







