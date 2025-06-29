data "aws_iam_policy_document" "s3-policy"{
	statement {
		principals {
			type = "AWS"
			identifiers = ["arn:aws:iam::663861047640:user/lks-user"]
		}
		
		actions = [
			"s3:GetObject",
			"s3:PutObject"
		]
		
		resources = [
			aws_s3_bucket.main-bucket.arn,
			"${aws_s3_bucket.main-bucket.arn}/*"
		]
	}
}



data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
