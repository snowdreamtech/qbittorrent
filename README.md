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

Docker image for qBittorrent providing standardized container foundations with flexible entrypoint systems, multi-architecture support, and consistent configuration patterns across Alpine, Debian, and Rocky Linux distributions, with optional Flood web user interface.

## Overview

The qBittorrent container provides:

- **Standardized Dockerfiles** with OCI annotations and best practices
- **Flexible entrypoint system** supporting custom initialization scripts
- **Consistent environment variable configuration** across all variants
- **Multi-architecture support** for diverse hardware platforms
- **User/group management** with PUID/PGID support for permission handling
- **Three distribution variants**: Alpine (lightweight), Debian (default/widely-compatible), Rocky (enterprise)
- **Two flavors**: core `qbittorrent` (with native Web UI) and `flood` (with modern Flood Web UI)

## Quick Start

```bash
# Pull and run the default Debian variant
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

# Or use docker compose
docker compose up -d
```

## Usage

Default Web UI access:
- **URL**: `http://localhost:8080`
- **Username**: `admin`
- **Password**: Check container logs on first startup or configure `WEBUI_USER` and `WEBUI_PASS`.

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

## Web UI Flavors

In addition to the standard `qbittorrent` flavor with native Web UI, a Flood-integrated flavor is available:

### Standard (`qbittorrent`)

Features the built-in qBittorrent Web UI on port 8080.

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

### Flood (`flood`)

Features the modern, responsive [Flood](https://github.com/jesec/flood) interface on port 3000.

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

## Distribution Variants

### Debian (Default)

The recommended variant for most use cases, providing wide compatibility and extensive package availability.

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

**Supported Architectures**: amd64, arm32v7, arm64, ppc64le, riscv64, s390x

**Base Image**: `snowdreamtech/debian:13.6.0`

### Alpine

Lightweight variant optimized for minimal image size and fast startup times.

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

**Supported Architectures**: 386, amd64, arm/v6, arm/v7, arm64, ppc64le, riscv64, s390x

**Base Image**: `snowdreamtech/alpine:3.24.1`

### Rocky

Enterprise-focused variant based on Rocky Linux, ideal for production environments requiring RHEL compatibility.

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

**Supported Architectures**: amd64, arm64, ppc64le, s390x

**Base Image**: `snowdreamtech/rocky:10.2.0`

## Environment Variables

All variants support the following environment variables for runtime configuration:

| Variable | Default | Description |
|----------|---------|-------------|
| `KEEPALIVE` | `1` | Keep container running (1=enabled, 0=disabled) |
| `CAP_NET_BIND_SERVICE` | `0` | Enable binding to privileged ports (<1024) |
| `LANG` | `C.UTF-8` | Locale setting for UTF-8 character support |
| `UMASK` | `022` | Default file creation mask |
| `DEBUG` | `false` | Enable debug output in entrypoint scripts |
| `PASSWORDLESS_SUDO` | `false` | Enable passwordless sudo for user |
| `PGID` | `0` | Primary group ID for custom user creation |
| `PUID` | `0` | User ID for custom user creation |
| `USER` | `root` | Username for custom user creation |
| `WORKDIR` | `/root` | Working directory path |
| `TZ` | - | Timezone (e.g., `Asia/Shanghai`, `America/New_York`) |
| `WEBUI_PORT` | `8080` | Web UI listening port |
| `PEER_PORT` | `25413` | BitTorrent peer communication port |
| `WEBUI_USER` | - | Custom username for Web UI authentication |
| `WEBUI_PASS` | - | Custom password for Web UI authentication |
| `WEBUI_LANG` | `en` | Web UI display language |
| `FLOOD_AUTH` | `none` | Authentication mode for Flood (`none` or `default`) |
| `FLOOD_PORT` | `3000` | Flood Web UI listening port |

**Debian-specific**:

| Variable | Default | Description |
|----------|---------|-------------|
| `DEBIAN_FRONTEND` | `noninteractive` | Debian package installation mode |

## Architecture Support

Each distribution variant supports multiple CPU architectures for deployment across diverse hardware platforms:

| Variant | Architectures |
|---------|---------------|
| **Debian** | amd64, arm32v7, arm64, ppc64le, riscv64, s390x |
| **Alpine** | 386, amd64, arm/v6, arm/v7, arm64, ppc64le, riscv64, s390x |
| **Rocky** | amd64, arm64, ppc64le, s390x |

Docker automatically selects the appropriate architecture for your platform when pulling images.

## Entrypoint System

The image includes a flexible entrypoint system that executes custom initialization scripts before starting your application.

### How It Works

1. The `docker-entrypoint.sh` script runs at container startup
2. It executes all executable scripts in `/usr/local/bin/entrypoint.d/` in lexical order
3. Each script receives the container's command-line arguments
4. If any script fails, the container stops (fail-fast behavior)

### Debug Mode

Enable debug output to troubleshoot entrypoint execution:

```bash
docker run -e DEBUG=true snowdreamtech/qbittorrent:debian
```

## Development

### Prerequisites

- Docker (>= 20.10) with Docker Buildx plugin
- [UniRTM](https://github.com/snowdreamtech/UniRTM) for workspace quality guard and toolchain management

### Quality & Verification

```bash
# Setup toolchain and verify environment
unirtm run setup

# Run comprehensive workspace quality check (formatters, linters, security)
unirtm run verify

# Run security audits (Zizmor, Gitleaks, OSV-Scanner, Trivy)
unirtm run audit

# Automatically fix linting and formatting issues where supported
unirtm run fix
```

## Reference

1. [qBittorrent Official Website](https://www.qbittorrent.org/)
2. [qBittorrent Official Repository](https://github.com/qbittorrent/qBittorrent)
3. [Flood - Modern Web UI for Torrent Clients](https://github.com/jesec/flood)
4. [qbt_pw_gen](https://github.com/saltydk/qbt_pw_gen)

## Contact (备注：qbittorrent)

- Email: <sn0wdr1am@qq.com>
- QQ: 3217680847
- QQ群: 949022145
- WeChat/微信群: sn0wdr1am

## License

MIT
