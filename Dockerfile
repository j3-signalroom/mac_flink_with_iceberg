# Base image from https://nightlies.apache.org/flink/flink-docs-release-1.19/docs/deployment/resource-providers/standalone/docker/
FROM arm64v8/flink:1.20.0-scala_2.12-java17
    
# ---
# Download JARs to FLINK_HOME/lib to make them available to Flink
# ---
# --- Iceberg Flink Library
RUN curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-flink-runtime-1.19/1.6.1/iceberg-flink-runtime-1.19-1.6.1.jar -o /opt/flink/lib/iceberg-flink-runtime-1.19-1.6.1.jar

# --- Hive Flink Library
RUN curl -L https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-hive-3.1.3_2.12/1.20.0/flink-sql-connector-hive-3.1.3_2.12-1.20.0.jar -o /opt/flink/lib/flink-sql-connector-hive-3.1.3_2.12-1.20.0.jar

# --- Hadoop Common Classes
RUN curl -L https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.4.0/hadoop-common-3.4.0.jar -o /opt/flink/lib/hadoop-common-3.4.0.jar

# --- Hadoop AWS Classes
RUN curl -L https://repo.maven.apache.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/2.8.3-10.0/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar -o /opt/flink/lib/flink-shaded-hadoop-2-uber-2.8.3-10.0.jar 

# --- AWS Bundled Classes
RUN curl -L https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/2.26.9/bundle-2.27.9.jar -o /opt/flink/lib/bundle-2.27.9.jar

# Install Nano to edit files
RUN apt update && apt install -y nano

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64

# Install PyFlink
RUN pip3 install --upgrade pip
RUN pip3 install "grpcio-tools>=1.29.0,<=1.50.0"
RUN pip3 install setuptools>=37.0.0
RUN pip3 install apache-flink==1.20.0
RUN pip3 install "pyiceberg[s3fs,hive,pandas]"

# Set the entrypoint to Flink's entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
