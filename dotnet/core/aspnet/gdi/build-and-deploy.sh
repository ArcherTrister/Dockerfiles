#!/bin/bash
 
VERSION="$1"
NAMESPACE="$2"
 
if [ -z "$VERSION" ]; then
echo "Usage: build-and-deploy.sh $VERSION  $NAMESPACE"
exit 1
fi
 
# Build docker image
docker build -t aspnet:$VERSION -f Dockerfile .

# Push docker image
docker tag aspnet:$VERSION registry.cn-hangzhou.aliyuncs.com/$NAMESPACE/aspnet:$VERSION
docker push registry.cn-hangzhou.aliyuncs.com/$NAMESPACE/aspnet:$VERSION

# Remove docker image
docker rmi aspnet:$VERSION
