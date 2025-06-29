resource "aws_iam_role" "role" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "archive" {
  type        = "zip"
  source_file = "${path.module}/lambda/index.js"
  output_path = "${path.module}/lambda/function.zip"
}


resource "aws_lambda_function" "function" {
  filename         = data.archive_file.archive.output_path
  function_name    = "hellow_lambda_function"
  role             = aws_iam_role.role.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.archive.output_base64sha256

  runtime = "nodejs20.x"

  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
    }
  }

  tags = {
    Environment = "production"
    Application = "example"
  }
}