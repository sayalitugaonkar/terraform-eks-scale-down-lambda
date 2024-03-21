resource "aws_lambda_function" "scale_down_nodes" {
  filename      = "scale-down.zip"
  function_name = "auto_nodes_scale_down"
  role          = "${aws_iam_role.lambda.arn}"
  handler       = "lambda_function.lambda_handler"
  source_code_hash = "${data.archive_file.python_lambda_package.output_base64sha256}"

  runtime = "python3.6"

  depends_on = [
    data.archive_file.python_lambda_package,
    aws_iam_role.lambda
  ]
}