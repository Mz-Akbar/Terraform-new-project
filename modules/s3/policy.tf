data "aws_iam_policy_document" "s3-policy"{
	statement {
		principals {
			type = "AWS"
			identifier = " [""arn:aws:iam::663861047640:user/lks-user""]
		}
		
		actions [
			"s3:GetObject",
			"s3:PutObject"
		]
		
		resource = [
			aws_s3_bucket.mybucket.arn
			"${aws_s3_bucket.mybucket.arn}/*"
		]
	}
}
