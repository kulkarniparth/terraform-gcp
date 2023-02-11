# Bucket Provisioning
resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  project  =  var.project_id
}

# Topic Provisioning
resource "google_pubsub_topic" "topic" {
  name     = var.topic_id
  project  =  var.project_id

  message_retention_duration = "86400s"
}

resource "google_pubsub_subscription" "example" {
  name  = var.topic_subscription
  topic = var.topic_name
  depends_on = [google_pubsub_topic.topic]
  project  =  var.project_id

}

# Role Binding for the GCS SA
resource "google_pubsub_topic_iam_binding" "binding" {
  topic   = var.topic_name
  role    = "roles/pubsub.publisher"
  members = ["serviceAccount:${var.gcs_service_agent}"]
  project  =  var.project_id
  depends_on = [google_storage_bucket.bucket, google_pubsub_topic.topic]
}

#notification config
resource "google_storage_notification" "notification" {
  bucket         = var.bucket_name
  payload_format = "JSON_API_V1"
  topic          = var.topic_name
  event_types    = ["OBJECT_FINALIZE", "OBJECT_METADATA_UPDATE","OBJECT_DELETE"]
  custom_attributes = {
    new-attribute = "new-attribute-value"
  }
  depends_on = [google_pubsub_topic_iam_binding.binding]
}

#Service Account for GCS with objectCreator access
resource "google_service_account" "service_account" {
  account_id   = var.application_sa_id
  project  =  var.project_id
}

#IAM binding for application service account
resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = "roles/objectCreator"
  members = [
    "serviceAccount:${var.application_sa}"
  ]
  depends_on = [
    google_service_account.service_account
  ]
}




