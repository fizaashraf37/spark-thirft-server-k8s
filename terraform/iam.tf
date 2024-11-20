resource "aws_iam_role" "data-spark-thrift-server-poc-staging" {
  name               = "data-spark-thrift-server-poc-staging"
  assume_role_policy = local.assume_role_policy

  tags = merge(local.tags, {
    cluster = local.k8s_cluster
    k8s     = "true"
  })
}

resource "aws_iam_role_policy" "data-spark-thrift-server-poc-staging" {
  name   = "data-spark-thrift-server-poc-staging"
  role   = aws_iam_role.data-spark-thrift-server-poc-staging.name
  policy = data.aws_iam_policy_document.data-spark-thrift-server-poc-staging.json
}

# This role is used for spark thrift server pod running in the staging k8s cluster to access iceberg s3 bucket.
data "aws_iam_policy_document" "data-spark-thrift-server-poc-staging" {

  statement {
    actions = [
      "s3:Get*",
    ]

    resources = [
      "arn:aws:s3:::sts-staging/iceberg/*",
    ]
  }

  statement {
    actions = [
      "s3:Put*",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
    ]

    resources = [
      "arn:aws:s3:::sts-staging/iceberg/kyuubi-files/*",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::sts-staging",
      "arn:aws:s3:::sts-staging/*",
      "arn:aws:s3:::sts-staging/iceberg",
      "arn:aws:s3:::sts-staging/iceberg/*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "glue:GetDatabase",
      "glue:GetTables",
      "glue:GetTable",
    ]

    resources = [
      "*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "glue:Get*",
      "glue:List*",
    ]

    resources = [
      "arn:aws:glue:us-east-1:<account_id>:catalog",
      "arn:aws:glue:us-east-1:<account_id>:database/tydb",
      "arn:aws:glue:us-east-1:<account_id>:database/iceberg",
    ]
  }
}
