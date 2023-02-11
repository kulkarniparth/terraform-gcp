# # Bucket Provisioning
# resource "google_storage_bucket" "bucket" {
#   name     = var.bucket_name
#   location = var.location
#   project  =  var.project_id
# }

# # Topic Provisioning
# resource "google_pubsub_topic" "topic" {
#   name     = var.topic_id
#   project  =  var.project_id
# }


# # Role Binding for the GCS SA
# resource "google_pubsub_topic_iam_binding" "binding" {
#   topic   = var.topic_name
#   role    = "roles/pubsub.publisher"
#   members = ["serviceAccount:${var.gcs_service_agent}"]
#   project  =  var.project_id
#   depends_on = [google_storage_bucket.bucket, google_pubsub_topic.topic]
# }

# #notification config
# resource "google_storage_notification" "notification" {
#   bucket         = var.bucket_name
#   payload_format = "JSON_API_V1"
#   topic          = var.topic_name
#   event_types    = ["OBJECT_FINALIZE", "OBJECT_METADATA_UPDATE"]
#   custom_attributes = {
#     new-attribute = "new-attribute-value"
#   }
#   depends_on = [google_pubsub_topic_iam_binding.binding, google_storage_bucket.bucket, google_pubsub_topic.topic]
# }