# WireGuard with iptables-legacy

[![Build Status](https://github.com/0xlnz/wireguard-iptables-legacy/actions/workflows/auto-build-on-upstream-release.yml/badge.svg)](https://github.com/0xlnz/wireguard-iptables-legacy/actions/workflows/auto-build-on-upstream-release.yml)
[![GitHub Container Registry](https://img.shields.io/badge/GHCR-0xlnz%2Fwireguard-blue?logo=github)](https://github.com/0xlnz/wireguard-iptables-legacy/pkgs/container/wireguard)

A wrapper around the official [linuxserver/wireguard](https://github.com/linuxserver/docker-wireguard) Docker image.

## 🚀 Why this image?

Standard WireGuard images often rely on `nftables`. However, some older kernels or specific NAS devices (like  **Synology DSM**) lack `nf_tables` support, leading to tunnel creation failures.

This repository runs a **daily GitHub Action** to check for new releases:
- **Tracks** the upstream `linuxserver/wireguard` releases.
- **Replaces** `iptables` with `iptables-legacy`.
- **Pushes** the result to GHCR.


## 📦 Usage

Simply replace your image reference in `docker-compose.yml`. This image serves as a drop-in replacement.

```yaml
services:
  wireguard:
    image: ghcr.io/0xlnz/wireguard:latest
  ...
```

> **Note:** For full configuration options (environment variables, volumes, etc.), please refer to the [original LinuxServer.io documentation](https://github.com/linuxserver/docker-wireguard).


## ❤️ Credits

- Based on the excellent work by [LinuxServer.io](https://www.linuxserver.io/).