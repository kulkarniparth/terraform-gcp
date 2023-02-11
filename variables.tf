variable "bucket_name" {
    type = string
    description = "bucket name"
    default = "file-upload-bucket-parth-kulkarni-unique-hopefully"
}

variable "topic_id" {
    type = string
    description = "topic id"
    default = "file-upload-topic-parth-kulkarni-unique-hopefully"
}

variable "topic_name" {
    type = string
    description = "topic name"
    default = "projects/valencia-377506/topics/file-upload-topic-parth-kulkarni-unique-hopefully"
}

variable "topic_subscription" {
    type = string
    description = "topic_subscription"
    default = "topic-subscription"
}

variable "location" {
    type = string
    description = "bucket location"
    default = "europe-west2"
}

variable "project_id" {
    type = string
    description = "project id"
    default = "valencia-377506"
}

variable "gcs_service_agent" {
    type = string
    description = "GCS default SA for Storage"
    default = "service-1028991994216@gs-project-accounts.iam.gserviceaccount.com"
}