resource "aws_s3_bucket" "main-bucket"{
    bucket = "my-tf-bucket"
}


resource "aws_s3_bucket_public_access_block" "acces-bucket"{
	bucket = "aws_s3_bucket.mainbucket-01.id"
	block_public_acls = true
	block_public_policy = true
	ignore_public_acls = true
	restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "s3-policy"{
	bucket = aws_s3_bucket.main-bucket.id
	policy = data.aws_iam_policy_document.s3-policy.json
}













