import boto3


def lambda_handler(event, context):

    eks = boto3.client("eks")

    region_name = "ap-southeast-1"

    cluster_name = "test-cluster"

    cluster_pool_names = ["node-pool-1", "t4a-medium-pool"]
    new_desiredSize = 0
    new_minSize = 0
    new_maxSize = 1

    # Loop through the node groups and update their desired capacity to 0
    for poolName in cluster_pool_names:
        response = eks.update_nodegroup_config(
            clusterName=cluster_name,
            nodegroupName=poolName,
            scalingConfig={
                "desiredSize": new_desiredSize,
                "minSize": new_minSize,
                "maxSize": new_maxSize
            }
        )