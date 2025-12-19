ARG UPSTREAM_TAG=latest
FROM ghcr.io/linuxserver/wireguard:${UPSTREAM_TAG}

# Install iptables-legacy and replace standard iptables binaries
# Note: linuxserver/wireguard is typically Alpine-based.
RUN if [ -f /etc/alpine-release ]; then \
      apk add --no-cache iptables-legacy && \
      # Remove standard binaries in both locations to be safe
      rm -f /sbin/iptables /sbin/iptables-save /sbin/iptables-restore /sbin/ip6tables /sbin/ip6tables-save /sbin/ip6tables-restore && \
      rm -f /usr/sbin/iptables /usr/sbin/iptables-save /usr/sbin/iptables-restore /usr/sbin/ip6tables /usr/sbin/ip6tables-save /usr/sbin/ip6tables-restore && \
      # Create symlinks to legacy binaries in /sbin
      ln -s /usr/sbin/iptables-legacy /sbin/iptables && \
      ln -s /usr/sbin/iptables-legacy-save /sbin/iptables-save && \
      ln -s /usr/sbin/iptables-legacy-restore /sbin/iptables-restore && \
      ln -s /usr/sbin/ip6tables-legacy /sbin/ip6tables && \
      ln -s /usr/sbin/ip6tables-legacy-save /sbin/ip6tables-save && \
      ln -s /usr/sbin/ip6tables-legacy-restore /sbin/ip6tables-restore && \
      # Create symlinks to legacy binaries in /usr/sbin
      ln -s /usr/sbin/iptables-legacy /usr/sbin/iptables && \
      ln -s /usr/sbin/iptables-legacy-save /usr/sbin/iptables-save && \
      ln -s /usr/sbin/iptables-legacy-restore /usr/sbin/iptables-restore && \
      ln -s /usr/sbin/ip6tables-legacy /usr/sbin/ip6tables && \
      ln -s /usr/sbin/ip6tables-legacy-save /usr/sbin/ip6tables-save && \
      ln -s /usr/sbin/ip6tables-legacy-restore /usr/sbin/ip6tables-restore; \
    else \
      # Fallback for Debian/Ubuntu based images
      apt-get update && \
      apt-get install -y iptables-legacy && \
      update-alternatives --install /usr/sbin/iptables iptables /usr/sbin/iptables-legacy 10 || true; \
    fi
