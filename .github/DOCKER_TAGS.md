# Docker Image Tags Reference

This document describes the Docker image tagging strategy for the qbittorrent project.

## Tag Naming Convention

All images use the format: `snowdreamtech/qbittorrent:TAG`

Where `TAG` follows these patterns:

- **Variant-specific tags**: `TAG-variant` (e.g., `nightly-alpine`, `5.3.0-alpine`)
- **Default tags** (Debian only): `TAG` (e.g., `nightly`, `latest`, `5.1.0`)
- **Flavor tags**:
  - `qbittorrent`: Core daemon
  - `flood`: Web UI powered by Flood (e.g., `latest-flood`, `latest-flood-alpine`, `5.3.0-flood-alpine`)

## Supported Registries

All tags are pushed to two registries:

- **GitHub Container Registry**: `ghcr.io/snowdreamtech/qbittorrent:TAG`
- **DockerHub**: `snowdreamtech/qbittorrent:TAG`

## Tag Scenarios

### 1. Branch Builds (dev/main)

#### Push to `dev` branch

```bash
git push origin dev
```

**Generated tags:**

```
snowdreamtech/qbittorrent:dev-alpine
snowdreamtech/qbittorrent:dev-debian
snowdreamtech/qbittorrent:dev              # ← Debian (default)
snowdreamtech/qbittorrent:dev-rocky
```

#### Push to `main` branch

```bash
git push origin main
```

**Generated tags:**

```
snowdreamtech/qbittorrent:main-alpine
snowdreamtech/qbittorrent:latest-alpine
snowdreamtech/qbittorrent:main-debian
snowdreamtech/qbittorrent:latest-debian
snowdreamtech/qbittorrent:main             # ← Debian (default)
snowdreamtech/qbittorrent:latest           # ← Debian (default)
snowdreamtech/qbittorrent:main-rocky
snowdreamtech/qbittorrent:latest-rocky
```

---

### 2. Release Tags (Semantic Versioning)

#### Alpine Release

```bash
git tag alpine-v5.3.0
git push origin alpine-v5.3.0
```

**Generated tags:**

```
snowdreamtech/qbittorrent:5.3.0-alpine
snowdreamtech/qbittorrent:latest-alpine
```

#### Debian Release

```bash
git tag debian-v5.1.0
git push origin debian-v5.1.0
```

**Generated tags:**

```
snowdreamtech/qbittorrent:5.1.0-debian
snowdreamtech/qbittorrent:latest-debian
snowdreamtech/qbittorrent:5.1.0           # ← Debian (default)
snowdreamtech/qbittorrent:latest          # ← Debian (default)
```

#### Rocky Release

```bash
git tag rocky-v5.2.4
git push origin rocky-v5.2.4
```

**Generated tags:**

```
snowdreamtech/qbittorrent:5.2.4-rocky
snowdreamtech/qbittorrent:latest-rocky
```

---

### 3. Nightly Builds (Scheduled)

**Trigger:** Automatically every day at 17:00 UTC

**Generated tags:**

```
# Alpine
snowdreamtech/qbittorrent:nightly-alpine

# Debian (with default tags)
snowdreamtech/qbittorrent:nightly-debian
snowdreamtech/qbittorrent:nightly          # ← Debian (default)

# Rocky
snowdreamtech/qbittorrent:nightly-rocky
```

---

## Tag Priority

Tags are generated with the following priority (higher number = higher priority):

| Priority | Type | Example Tags | Trigger |
|----------|------|--------------|---------|
| 1000 | Nightly | `nightly`, `nightly-alpine` | Schedule |
| 800 | Version | `5.3.0-alpine`, `5.1.0` | Tag push |
| 600 | Branch | `dev-alpine`, `main-debian` | Branch push |
| 200 | Latest | `latest`, `latest-alpine` | Main/Tag |

---

## Default Variant (Debian)

Debian is designated as the **default variant** (`is_latest: true`), which means:

✅ **Debian gets BOTH suffixed AND unsuffixed tags:**

```
snowdreamtech/qbittorrent:nightly-debian   # Variant-specific
snowdreamtech/qbittorrent:nightly          # Default (no suffix)

snowdreamtech/qbittorrent:5.1.0-debian     # Variant-specific
snowdreamtech/qbittorrent:5.1.0            # Default (no suffix)

snowdreamtech/qbittorrent:latest-debian    # Variant-specific
snowdreamtech/qbittorrent:latest           # Default (no suffix)
```

❌ **Alpine and Rocky get ONLY suffixed tags:**

```
snowdreamtech/qbittorrent:nightly-alpine   # Variant-specific only
snowdreamtech/qbittorrent:nightly-rocky    # Variant-specific only
```

---

## Usage Examples

### Pull the latest Debian image (default)

```bash
docker pull snowdreamtech/qbittorrent:latest
# or
docker pull snowdreamtech/qbittorrent:latest-debian
```

### Pull the latest Alpine image

```bash
docker pull snowdreamtech/qbittorrent:latest-alpine
```

### Pull the latest Rocky image

```bash
docker pull snowdreamtech/qbittorrent:latest-rocky
```

### Pull a specific version

```bash
# Alpine 5.3.0
docker pull snowdreamtech/qbittorrent:5.3.0-alpine

# Debian 5.1.0 (two ways)
docker pull snowdreamtech/qbittorrent:5.1.0-debian
docker pull snowdreamtech/qbittorrent:5.1.0

# Rocky 5.2.4
docker pull snowdreamtech/qbittorrent:5.2.4-rocky
```

### Pull Flood Web UI images

```bash
# Flood Web UI
docker pull snowdreamtech/qbittorrent:latest-flood
docker pull snowdreamtech/qbittorrent:latest-flood-alpine
docker pull snowdreamtech/qbittorrent:latest-flood-debian
docker pull snowdreamtech/qbittorrent:latest-flood-rocky
```

---

## Metadata Action Configuration

The key configuration that enables this tagging strategy:

```yaml
images: |
  name=ghcr.io/snowdreamtech/qbittorrent,enable=true
  name=snowdreamtech/qbittorrent,enable=true
flavor: |
  latest=false
  prefix=
  suffix=
```
