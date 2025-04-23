# 基于R探长抢机机脚本构建的docker-compose部署方案

## 简介

本项目是利用R探长抢机机脚本构建的docker镜像，同时一键部署到docker环境中，实现自动化抢机方案。

## 环境准备

## 一、安装

### 1. 克隆本项目到本地：
   ```bash
   git clone https://github.com/zszweb/rbot-docker
   ```
### 2. 进入项目目录：
   ```bash
   cd rbot-docker
   ```
### 3. 安装docker环境：
   ```bash
   # 安装docker
   apt update -y
   apt install -y curl 
   curl -fsSL https://get.docker.com | bash -s docker
   # 安装docker-compose
   sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
   ```

### 4. docker环境运行：
   ```bash
   docker-compose up -d --build
   ```



## 二、相关文件说明
### client_config文件配置：

```
   到甲骨文云下载API证书并获取API信息，填入client_config文件中。 下载的API证书文件名更改为为key.pem，并将其放置在rbot-docker目录下。
   示例：
   oci=begin
      [DEFAULT]
      user=******************************
      fingerprint=*****************************
      tenancy=*************
      region=jp-tokyo-1
      key_file=./key.pem
   oci=end

   #用户信息 从 https://t.me/radiance_helper_bot 配置(bot可使用/raninfo命令随机生成)
   #必传
   username=*****************************
   password=*****************************
```

### ❤️ 开源协议
欢迎使用、修改和传播这个脚本！如果你觉得它对你有帮助，记得来点个 Star ⭐ 哦～


### 💡 赞助声明
本项目由 VTEXS 的「开源项目免费 VPS 计划」提供算力支持。
感谢 VTEXS 对开源社区的支持！
