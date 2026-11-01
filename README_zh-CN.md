# qBittorrent

[![CI Pipeline](https://img.shields.io/github/actions/workflow/status/snowdreamtech/qbittorrent/ci.yml?branch=main&label=CI%20Pipeline)](https://github.com/snowdreamtech/qbittorrent/actions/workflows/ci.yml)
[![CD Pipeline](https://img.shields.io/github/actions/workflow/status/snowdreamtech/qbittorrent/cd.yml?branch=main&label=CD%20Pipeline)](https://github.com/snowdreamtech/qbittorrent/actions/workflows/cd.yml)
[![CodeQL](https://img.shields.io/github/actions/workflow/status/snowdreamtech/qbittorrent/codeql.yml?branch=main&label=CodeQL&logo=github)](https://github.com/snowdreamtech/qbittorrent/actions/workflows/codeql.yml)
[![Security Audit](https://img.shields.io/badge/Security-Zizmor%20%7C%20Trivy%20%7C%20Gitleaks-brightgreen)](https://github.com/snowdreamtech/qbittorrent/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/license/MIT)
![Docker Image Version](https://img.shields.io/docker/v/snowdreamtech/qbittorrent)
![Docker Image Size](https://img.shields.io/docker/image-size/snowdreamtech/qbittorrent/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/snowdreamtech/qbittorrent)
![Docker Stars](https://img.shields.io/docker/stars/snowdreamtech/qbittorrent)

[English](README.md) | [简体中文](README_zh-CN.md)

基于 Alpine、Debian 与 Rocky Linux 的标准化 qBittorrent Docker 镜像，具备灵活的 entrypoint 系统、多架构支持和跨发行版的一致配置模式，并提供集成了现代化 Flood Web 界面版本。

## 概述

qBittorrent 容器镜像提供：

- **标准化 Dockerfile**，遵循 OCI 规范与容器最佳实践
- **灵活的 entrypoint 体系**，支持自定义初始化脚本
- **一致的环境变量配置**，跨所有发行版变体统一
- **全面的多架构支持**，适配各类硬件平台
- **用户/用户组管理**，支持 PUID/PGID 权限映射
- **三种系统变体**：Alpine（轻量级）、Debian（默认/高兼容性）、Rocky（企业级）
- **两种构建风味**：核心 `qbittorrent`（内置 Web UI）以及现代化的 `flood`（集成 Flood Web UI）

## 快速上手

```bash
# 拉取并运行默认的 Debian 镜像
docker pull snowdreamtech/qbittorrent:debian
docker run -d \
  --name=qbittorrent \
  -e TZ=Asia/Shanghai \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:debian

# 或者使用 docker compose
docker compose up -d
```

## 使用说明

默认 Web UI 访问信息：
- **访问地址**: `http://localhost:8080`
- **默认用户名**: `admin`
- **默认密码**: 首次启动时会在容器日志中打印临时密码，或通过环境变量 `WEBUI_USER` 与 `WEBUI_PASS` 自行指定。

### Docker CLI

```bash
docker run -d \
  --name=qbittorrent \
  -e TZ=Asia/Shanghai \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:latest
# snowdreamtech/qbittorrent:alpine
# snowdreamtech/qbittorrent:debian
# snowdreamtech/qbittorrent:rocky
```

### Docker Compose

```yaml
services:
  qbittorrent:
    image: snowdreamtech/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - TZ=Asia/Shanghai
      - WEBUI_PORT=8080
      - PEER_PORT=25413
    ports:
      - "8080:8080"
      - "25413:25413"
      - "25413:25413/udp"
    volumes:
      - ./downloads:/var/lib/qBittorrent/downloads
      - ./config:/var/lib/qBittorrent/config
    restart: unless-stopped
```

## Web UI 风味版本

除了带有原生 Web UI 的标准版 `qbittorrent` 之外，还提供了集成现代 Web 前端 Flood 的镜像：

### 标准版 (`qbittorrent`)

采用 qBittorrent 原生 Web UI，监听 8080 端口。

```bash
docker run -d \
  --name=qbittorrent \
  -e TZ=Asia/Shanghai \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:latest
```

### Flood 前端版 (`flood`)

集成基于 Node.js 开发的现代化 [Flood](https://github.com/jesec/flood) 前端界面，监听 3000 端口。

```bash
docker run -d \
  --name=qbittorrent-flood \
  -e TZ=Asia/Shanghai \
  -p 3000:3000 \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:latest-flood
```

## 发行版变体

### Debian（默认）

适用于绝大多数使用场景的推荐变体，具备极佳的兼容性与完备的软件包生态。

```bash
docker run -d \
  --name=qbittorrent \
  -e TZ=Asia/Shanghai \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:debian
```

**支持的架构**: amd64, arm32v7, arm64, ppc64le, riscv64, s390x

**基础镜像**: `snowdreamtech/debian:13.6.0`

### Alpine

轻量级变体，针对极小的镜像体积和极快的容器启动速度进行了优化。

```bash
docker run -d \
  --name=qbittorrent \
  -e TZ=Asia/Shanghai \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:alpine
```

**支持的架构**: 386, amd64, arm/v6, arm/v7, arm64, ppc64le, riscv64, s390x

**基础镜像**: `snowdreamtech/alpine:3.24.1`

### Rocky

基于 Rocky Linux 的企业级变体，适合对 RHEL/CentOS 兼容性有要求的生产环境。

```bash
docker run -d \
  --name=qbittorrent \
  -e TZ=Asia/Shanghai \
  -p 8080:8080 \
  -p 25413:25413 \
  -p 25413:25413/udp \
  -v ./downloads:/var/lib/qBittorrent/downloads \
  -v ./config:/var/lib/qBittorrent/config \
  --restart unless-stopped \
  snowdreamtech/qbittorrent:rocky
```

**支持的架构**: amd64, arm64, ppc64le, s390x

**基础镜像**: `snowdreamtech/rocky:10.2.0`

## 环境变量

所有变体均支持以下环境变量配置：

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `KEEPALIVE` | `1` | 保持容器持续运行（1=启用，0=禁用） |
| `CAP_NET_BIND_SERVICE` | `0` | 允许绑定到特权端口（<1024） |
| `LANG` | `C.UTF-8` | 容器字符集配置 |
| `UMASK` | `022` | 默认文件创建权限掩码 |
| `DEBUG` | `false` | 启用 entrypoint 初始化脚本的调试输出 |
| `PASSWORDLESS_SUDO` | `false` | 允许非 root 用户免密使用 sudo |
| `PGID` | `0` | 自定义用户的主要用户组 ID |
| `PUID` | `0` | 自定义用户的用户 ID |
| `USER` | `root` | 自定义用户名 |
| `WORKDIR` | `/root` | 工作目录路径 |
| `TZ` | - | 时区配置（如 `Asia/Shanghai`、`America/New_York`） |
| `WEBUI_PORT` | `8080` | Web UI 监听端口 |
| `PEER_PORT` | `25413` | BitTorrent 节点传输通信端口 |
| `WEBUI_USER` | - | Web UI 认证自定义用户名 |
| `WEBUI_PASS` | - | Web UI 认证自定义密码 |
| `WEBUI_LANG` | `en` | Web UI 界面语言 |
| `FLOOD_AUTH` | `none` | Flood 鉴权模式（`none` 或 `default`） |
| `FLOOD_PORT` | `3000` | Flood Web UI 监听端口 |

**Debian 专属变量**:

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `DEBIAN_FRONTEND` | `noninteractive` | Debian 软件包安装交互模式 |

## 架构支持

各发行版变体支持的 CPU 架构如下：

| 发行版变体 | 支持架构 |
|-----------|----------|
| **Debian** | amd64, arm32v7, arm64, ppc64le, riscv64, s390x |
| **Alpine** | 386, amd64, arm/v6, arm/v7, arm64, ppc64le, riscv64, s390x |
| **Rocky** | amd64, arm64, ppc64le, s390x |

拉取镜像时，Docker 将自动匹配适合当前宿主机架构的镜像版本。

## Entrypoint 系统

本镜像集成了一套高扩展性的 entrypoint 体系，在应用启动前按顺序执行初始化脚本。

### 执行机制

1. 容器启动时运行 `docker-entrypoint.sh` 脚本
2. 按字典序遍历并执行 `/usr/local/bin/entrypoint.d/` 目录下所有具有执行权限的脚本
3. 所有脚本均会透传容器启动时附带的命令行参数
4. 任一脚本执行失败将立即中止容器运行（fail-fast 机制）

### 调试模式

通过开启 DEBUG 环境变量排查 entrypoint 执行细节：

```bash
docker run -e DEBUG=true snowdreamtech/qbittorrent:debian
```

## 开发与维护

### 环境依赖

- Docker (>= 20.10) 并安装 Docker Buildx 插件
- [UniRTM](https://github.com/snowdreamtech/UniRTM) 用于工作区质量防护与工具链管理

### 代码质量检查与校验

```bash
# 安装并验证工具链
unirtm run setup

# 运行完整的工作区质量检查（格式化、代码风格、安全扫描）
unirtm run verify

# 运行安全专项审计（Zizmor, Gitleaks, OSV-Scanner, Trivy）
unirtm run audit

# 自动修复支持的代码规范与格式问题
unirtm run fix
```

## 参考资料

1. [qBittorrent 官方网站](https://www.qbittorrent.org/)
2. [qBittorrent 官方仓库](https://github.com/qbittorrent/qBittorrent)
3. [Flood - Modern Web UI for Torrent Clients](https://github.com/jesec/flood)
4. [qbt_pw_gen](https://github.com/saltydk/qbt_pw_gen)

## 联系方式 (备注：qbittorrent)

- 邮箱: <sn0wdr1am@qq.com>
- QQ: 3217680847
- QQ群: 949022145
- 微信/微信群: sn0wdr1am

## 开源协议

MIT
