output "api_function_name" {
  description = "Name of the API Lambda function."

  value = aws_lambda_function.api.function_name
}

output "base_url" {
  description = "Base URL for API Gateway stage."

  value = aws_apigatewayv2_stage.api.invoke_url
}
