# NodeStatus-Docker

## 鸣谢

- [cokemine/nodestatus](https://github.com/cokemine/nodestatus)

## 概述

本项目为 NodeStatus 容器集成了 Caddy，只需要在环境变量中设置域名即可全自动申请证书启用 HTTPS，状态页可选用户名/密码认证。

支持部署到 Render 等支持 Dockerfile 的免费 PaaS 服务。

## Docker 部署

 1. 目前只有 AMD64 架构支持。
 
 2. 下载[docker-compose文件](https://github.com/wy580477/NodeStatus-Docker/blob/main/docker-compose.yml)。

 3. 按说明设置好变量，用如下命令运行容器。

        docker-compose up -d

## 部署到 PaaS 平台

可以直接使用本库或者 fork 本库，然后在 PaaS 平台上走 CI/CD 流程部署。

支持拉取容器镜像的 PaaS 平台，可以直接拉取本库的容器镜像 ghcr.io/wy580477/nodestatus-docker:latest 部署。

需要注意数据持久化问题。有两种解决方法：

1. 在支持持久存储卷的 PaaS 平台上（Doprax 等），可以使用默认的 SQLite 数据库，需要将持久存储卷挂载到 "/usr/local/NodeStatus/server/" 。 

2. 在不支持持久存储卷的 PaaS 平台上（Render 等），需要使用外部的 MySQL 或是 PostgreSQL 数据库 （免费数据库服务有 bit.io 等）。

在 PaaS 平台上部署时，环境变量设置：

| 变量 | 默认值 | 说明 |
| :--- | :--- | :--- |
| `USER` | `admin` | 访问状态页用户名 |
| `PASSWORD` | `password` | 访问状态页密码，务必设置为强密码 |
| `NO_AUTH` | Disable | 设置为"Enable"则不需要用户名/密码即可访问状态页 |
| `PORT` | 3000 | 内部 WEB 服务端口，PaaS 平台多数可以自动识别，无需设置 |

其它变量详见：https://github.com/cokemine/nodestatus#environment
