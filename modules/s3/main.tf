resource "aws_s3_bucket" "mybucket"{
    name = "my-tf-bucket"
}

resource "aws_s3_bucket "mybucket"{
	name = "tf-my-bucket"
}

resource "aws_s3_bucket_public_access_block" "acces-bucket"{
	bucket = "aws_s3_bucket.mybucket.id
	block_public_acls = true
	block_public_policy = true
	ignore_public_acls = true
	restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "s3-policy"{
	bucket = aws_s3_bucket.mybucket.id
	policy = data.aws_iam_policy_document.s3-policy.json
}













