# Apache Flink with Apache Iceberg support for the Mac M chip
This repository hosts the [`Dockerfile`](https://github.com/j3-signalroom/mac_flink_with_iceberg/blob/main/Dockerfile), which defines the Apache Flink Docker image with Apache Iceberg for Mac M1, M2, or M3 silicon chips.  The official Apache Flink image on [Docker Hub](https://hub.docker.com/r/arm64v8/flink/) does not contain Hadoop and Apache Iceberg dependencies.  This image extends the official image by adding Apache Iceberg.  You can use this Docker image to deploy Flink in [Session Mode](https://github.com/j3-signalroom/j3-techstack-lexicon/blob/main/apache-flink-glossary.md#flink-session-mode) or [Application Mode](https://github.com/j3-signalroom/j3-techstack-lexicon/blob/main/apache-flink-glossary.md#flink-application-mode) cluster on Docker, which allows you to read and write to Apache Iceberg tables.

**Table of Contents**

<!-- toc -->
+ [1.0 Let's get started!](#10-lets-get-started)
+ [2.0 Resources](#20-resources)
<!-- tocstop -->

## 1.0 Let's get started!
To run the Docker container locally:
1. Clone the repo:
    ```shell
    git clone https://github.com/j3-signalroom/mac_flink_with_iceberg.git
    ```

2. Login in to your docker desktop.

3. We'll run the [Dockerfile](Dockerfile) via [docker-compose](docker-compose.yml), so please follow these steps:

    a. Navigate to the root folder of the `mac_flink_with_iceberg/` repository that you cloned.

    b. Open a terminal in this directory.

    c. Execute the following [script](scripts/run-flink-locally.sh):
    ```bash
    scripts/run-flink-locally.sh --profile=<AWS_SSO_PROFILE_NAME> [--aws_s3_bucket=<AWS_S3_BUCKET_NAME>]
    ```
    Argument placeholder|Replace with
    -|-
    `<AWS_SSO_PROFILE_NAME>`|your AWS SSO profile name for your AWS infrastructue that host your AWS Secrets Manager.
    `<AWS_S3_BUCKET_NAME>`|**[Optional]** can specify the name of the AWS S3 bucket used to store Apache Iceberg files.

## 2.0 Resources

[Apache Flink 1.20.0](https://nightlies.apache.org/flink/flink-docs-release-1.20/)

[Apache Iceberg 1.6.1](https://github.com/apache/iceberg/releases/tag/apache-iceberg-1.6.1)
