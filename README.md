# Wireguard with iptables-legacy

This is a wrapper around the official [linuxserver/wireguard](https://github.com/linuxserver/docker-wireguard) Docker image.
It replaces `iptables` with `iptables-legacy` to support kernels without `nf_tables` support (e.g., older Synology NAS).

## How it works

The GitHub Actions workflow runs daily to check for new releases of `linuxserver/docker-wireguard`.
If a new release is found:
1. It builds a new image based on the upstream tag.
2. Installs `iptables-legacy` (handling both Alpine and Debian bases).
3. Pushes the image to GHCR.
4. Updates `.last_upstream` in the repo to track the latest built version.

## Usage

Replace your image reference in `docker-compose.yml`:

```yaml
image: ghcr.io/0xlnz/wireguard:latest
```
