variable "bucket_name" {
    type = string
    description = "bucket name"
    default = "file-upload-bucket"
}

variable "location" {
    type = string
    description = "bucket location"
    default = "europe-west2"
}