FROM docker.io/rockylinux:9

# Install native packages
RUN dnf -y update && \
	dnf -y install git clang clang-devel clang-tools-extra libxkbcommon-devel pkg-config openssl-devel libxcb-devel pulseaudio-libs-devel && \
	dnf clean all

# Create user
RUN useradd -d /home/coder coder && chown -R coder /home/coder
USER coder

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install NodeJS
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
RUN nvm use lts/hydrogen
# Install nodejs packages
RUN npm i -g pnpm xo snowpack