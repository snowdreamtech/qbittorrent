# Changelog

## [5.2.1](https://github.com/snowdreamtech/qbittorrent/compare/rocky-v5.2.1...rocky-v5.2.1) (2026-08-13)


### 🐛 Bug Fixes

* **docker:** align dnf flags with base template in qbittorrent rocky Dockerfile ([dcdcdbd](https://github.com/snowdreamtech/qbittorrent/commit/dcdcdbd8be7f3b6c5b6fd115700136caefedb335))
* **docker:** correct dnf package specification for qbittorrent-nox on rocky ([80adf0d](https://github.com/snowdreamtech/qbittorrent/commit/80adf0dae671a52f19a91eb9302e7280d7bc85d3))
* **docker:** enable crb repository on dnf install in rocky Dockerfiles ([b192b4e](https://github.com/snowdreamtech/qbittorrent/commit/b192b4e74fb3e46f2aaa00714197b669dbf30907))
* **docker:** use qbittorrent-nox package name without version constraint for multi-arch compatibility ([97cea5a](https://github.com/snowdreamtech/qbittorrent/commit/97cea5a0f42f90f1137e4e7e1b11899b70fdd674))
* remove static version defaults from OCI image labels to use variable injection exclusively ([da5645a](https://github.com/snowdreamtech/qbittorrent/commit/da5645ad4d48467290235abbbd9f31ba70bf690f))


### ♻️ Miscellaneous Chores

* add 0-git-keep.sh to prevent empty entrypoint.d directories ([ce77247](https://github.com/snowdreamtech/qbittorrent/commit/ce77247762becc1edf85ec7b57747d3f3127044a))
* **docker:** ignore unavailable repos for rocky build ([a6b6b6e](https://github.com/snowdreamtech/qbittorrent/commit/a6b6b6e5b2288cfeb6b2777902b85e7e5f37f2c3))
* release main ([5a92edb](https://github.com/snowdreamtech/qbittorrent/commit/5a92edb4ba76b04ee6de7369e9471f785849a7ae))
* release main ([4011a21](https://github.com/snowdreamtech/qbittorrent/commit/4011a21a23395acc9545168c95ca0ec5c867e7d3))
* release main ([d52be5c](https://github.com/snowdreamtech/qbittorrent/commit/d52be5cf0c5cff45f7f72e973d62c94b48855e1b))
* **release:** deduplicate CHANGELOG headers ([c2bba24](https://github.com/snowdreamtech/qbittorrent/commit/c2bba247dca89a31accc6e70c5e48b16170b1ce5))
* **release:** deduplicate CHANGELOG headers ([4f07b71](https://github.com/snowdreamtech/qbittorrent/commit/4f07b71194f58ba214f1fb60ce0dc56d71c499e2))
* **release:** deduplicate CHANGELOG headers ([3068d88](https://github.com/snowdreamtech/qbittorrent/commit/3068d883bc6167773d046d3b2b0e4c479e4fee39))
* **speckit:** manual auto-commit trigger ([5f8a5a9](https://github.com/snowdreamtech/qbittorrent/commit/5f8a5a9cba5d6bd42a65eaabfecd6e18b01aeeb0))

## [10.2.0](https://github.com/snowdreamtech/base/compare/rocky-v10.2.0...rocky-v10.2.0) (2026-06-29)


### 🐛 Bug Fixes

* use ghcr.io for base images to avoid rate limits ([9f1d73a](https://github.com/snowdreamtech/base/commit/9f1d73a75a61f2f368f5572c4bd28f4c92ef8fd5))


### ♻️ Miscellaneous Chores

* release main ([b3a5cc9](https://github.com/snowdreamtech/base/commit/b3a5cc9ef0a64a7bc04ed7c2acf0cca5327c5c26))

## [10.1.0](https://github.com/snowdreamtech/base/compare/rocky-v10.1.0...rocky-v10.1.0) (2026-04-29)


### 🛠 Refactoring

* **docker:** align Dockerfiles with base image structure ([232574f](https://github.com/snowdreamtech/base/commit/232574fed8418f8c7f257d001e951361dfa467a0))
* remove redundant docker-entrypoint.sh files ([87c576b](https://github.com/snowdreamtech/base/commit/87c576b27731ad11c5bc0ebc661e07c5a09ff1c1))
* reorganize distribution variants into docker directory ([67a8c91](https://github.com/snowdreamtech/base/commit/67a8c911e21801bf12b3e83d02e22f3b3f59a2ba))


### 📖 Documentation

* add detailed comments to entrypoint initialization scripts ([f42cbaa](https://github.com/snowdreamtech/base/commit/f42cbaab6edfbc5c38c2a636dfd8651fea900940))


### ♻️ Miscellaneous Chores

* **main:** release 0.14.0 ([043d2a4](https://github.com/snowdreamtech/base/commit/043d2a4202505e42c645e899c6731f5fb8f52c8e))
* release 0.6.1 ([f6fc042](https://github.com/snowdreamtech/base/commit/f6fc042cad7d1c4991a20657655bc4b6b339d0d9))
* release 0.7.1 ([5535492](https://github.com/snowdreamtech/base/commit/5535492160f3525dff06ff9f0c6d78147467bed3))
* **release:** v0.4.0 - Fix Dependabot docker-compose detection ([e91f7d8](https://github.com/snowdreamtech/base/commit/e91f7d882f3c7b23260f4da02f0e5e53d6399968))
