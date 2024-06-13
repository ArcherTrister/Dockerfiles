#!/bin/bash
 
VERSION="$1"
NAMESPACE="$2"

if [ -z "$VERSION" ]; then
echo "Usage: build-and-deploy.sh $VERSION  $NAMESPACE"
exit 1
fi
 
# Build docker image
# docker build -t minio:$VERSION -f Dockerfile .

# Push docker image
# docker tag minio:$VERSION registry.cn-hangzhou.aliyuncs.com/$NAMESPACE/minio:$VERSION
# docker push registry.cn-hangzhou.aliyuncs.com/$NAMESPACE/minio:$VERSION

# Build and push docker image
docker buildx create --use
docker buildx build --push --platform 'linux/amd64' --tag "registry.cn-hangzhou.aliyuncs.com/$NAMESPACE/minio:$VERSION" --file Dockerfile .

# Remove docker image
docker rmi minio:$VERSION
