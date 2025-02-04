variable "region" {
  type        = string
  description = "AWS Region"
}

variable "lifecycle_rule_enabled" {
  type        = bool
  description = "Enable lifecycle events on this bucket"
  default     = true
}

variable "noncurrent_version_expiration_days" {
  description = "Specifies when noncurrent object versions expire"
  default     = 90
}

variable "noncurrent_version_transition_days" {
  description = "Specifies when noncurrent object versions transitions"
  default     = 30
}

variable "standard_transition_days" {
  description = "Number of days to persist in the standard storage tier before moving to the infrequent access tier"
  default     = 30
}

variable "glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  default     = 60
}

variable "expiration_days" {
  description = "Number of days after which to expunge the objects"
  default     = 90
}

variable "create_access_log_bucket" {
  type        = bool
  default     = false
  description = "Whether or not to create an access log bucket."
}

variable "access_log_bucket_name" {
  type        = string
  default     = ""
  description = "If var.create_access_log_bucket is false, this is the name of the S3 bucket where s3 access logs will be sent to."
}

variable "acl" {
  type        = string
  description = <<-EOT
    The canned ACL to apply. We recommend log-delivery-write for
    compatibility with AWS services. Valid values are private, public-read,
    public-read-write, aws-exec-read, authenticated-read, bucket-owner-read,
    bucket-owner-full-control, log-delivery-write.

    Due to https://docs.aws.amazon.com/AmazonS3/latest/userguide/create-bucket-faq.html, this
    will need to be set to 'private' during creation, but you can update normally after.
    EOT
  default     = "log-delivery-write"
}