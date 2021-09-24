#! /bin/bash

./gradlew clean assemble

IMAGES=(
    'bellsoft/liberica-openjre-debian:17' # contains glibc
    'bellsoft/liberica-openjre-alpine:17' # contains glibc
    'bellsoft/liberica-openjre-alpine-musl:17'

    'azul/zulu-openjdk:17' # contains glibc
    'azul/zulu-openjdk-alpine:17-jre'
)

OUTPUT_FILE='test.out'
OUTPUT_IMAGE='netty-gh-11701'
echo -n '' > "$OUTPUT_FILE"

for DOCKER_IMAGE in "${IMAGES[@]}"; do
    echo "Testing $DOCKER_IMAGE"

    export DOCKER_IMAGE
    envsubst < 'Dockerfile.tmpl' > Dockerfile

    docker pull "$DOCKER_IMAGE"
    docker build -t "$OUTPUT_IMAGE" .

    echo "$DOCKER_IMAGE" | tr '/' '_' >> "$OUTPUT_FILE"
    docker run --rm "$OUTPUT_IMAGE" >> "$OUTPUT_FILE"

    docker rmi "$OUTPUT_IMAGE":latest
    rm Dockerfile
done
