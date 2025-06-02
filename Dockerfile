FROM ubuntu:20.04

# Set the timezone
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install required system dependencies
# Update the package list and install necessary tools
# This includes iptables, tcpdump, dsniff, iproute2, python3, python3-pip, tmux, and dnsutils
#iptables is used for network packet filtering, tcpdump for capturing network traffic,
# dsniff for network sniffing, iproute2 for advanced networking, python3 and pip for Python support,
# tmux for terminal multiplexing, and dnsutils for DNS utilities.
# Use non-interactive mode to avoid prompts during installation

RUN apt-get update && apt-get install -y \
    iptables \
    tcpdump \
    dsniff \
    iproute2 \
    python3 \
    python3-pip \
    tmux \
    dnsutils

# Install specific versions of Werkzeug and mitmproxy
# Werkzeug is a comprehensive WSGI web application library, and mitmproxy is an interactive TLS-capable intercepting proxy.
# The versions are specified to ensure compatibility with the rest of the stack.
RUN pip3 install "werkzeug<2.1.0" "mitmproxy==7.0.4"

# Default command to keep the container running
# Use a trap to keep the container alive
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
