## Lambda function with terraform to scale down nodes at midnight ##


Kubernetes is a powerful orchestration tool for managing containerized applications and is the most popular container-orchestration platform in use today. 

However, while AWS EKS provides a powerful and convenient way to manage containerized applications, it can also be costly. 

This project is regarding cost optimization of your dev cluster wherein node group is scaled down on schedule `for example, at night`

In `lambda_function.tf`, we are defining a lambda function to be taken as a zip file created in archive.tf

We are adding triggers via Cloudwatch event rules and downsizing the node group mentioned in file to 0



