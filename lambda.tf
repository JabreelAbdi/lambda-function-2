locals {
  lambda_zip_location = "outputs/welcome.zip"
}

data "archive_file" "welcome" {
  type        = "zip"
  source_file = "welcome.py"
  output_path = "${locals.lambda_zip_location}"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "${locals.lambda_zip_location}"
  function_name = "welcome"
  role          = aws_iam_role.lambda_role.arn
  handler       = "welcome.hello"

  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  runtime = "Python 3.7"

}