resource "aws_cloudwatch_event_rule" "scale_down_events" {
  name                  = "trigger_scale_down_event"
  description           = "Schedule lambda function"
  schedule_expression   = "cron(0 0 * * *)"
}

resource "aws_cloudwatch_event_target" "target_lambda_function" {
  target_id = "lambda-function-target"
  rule      = "${aws_cloudwatch_event_rule.scale_down_events.name}"
  arn       = "${aws_lambda_function.scale_down_nodes.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch" {    
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.scale_down_nodes.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.scale_down_events.arn}"
}