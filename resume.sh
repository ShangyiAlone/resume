#!/bin/bash

# 容器名称
CONTAINER_NAME="my-resume-website"

# 检查容器是否已经存在
if [ $(docker ps -a -f name=^/${CONTAINER_NAME}$ --format '{{.Names}}') ]; then
    echo "容器 ${CONTAINER_NAME} 已存在。正在尝试重新启动..."
    # 停止并删除旧容器
    docker stop ${CONTAINER_NAME}
    docker rm ${CONTAINER_NAME}
    echo "旧容器已删除。"
fi

# 启动新的 Docker 容器
echo "正在启动新的 Docker 容器..."
docker run --name ${CONTAINER_NAME} -v /root/个人简历/resume:/usr/share/nginx/html:ro -p 8080:80 -d nginx

echo "容器 ${CONTAINER_NAME} 已成功启动。"
