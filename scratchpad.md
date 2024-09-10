```bash
docker buildx build --platform linux/arm64 --no-cache -t j3signalroom/mac_flink-with_hadoop_iceberg --push .
```


# Run Flink Locally
```
scripts/run-flink-locally.sh --profile=AdministratorAccess-211125543747
```