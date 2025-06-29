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


resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}