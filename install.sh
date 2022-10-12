#!/usr/bin/env bash

# Verifies if dependencies are installed
check-deps() {
    for dep in "$@"; do
        if [[ -z "$(which $dep)" ]]; then
            error "Depencency $dep not found. Please install it and try again."
        fi
    done
}

# Installs OmniSharp, the C# LSP implementation used in this setup
install-omnisharp() {
    mkdir -p /usr/local/bin/omnisharp 2>/dev/null
    cd /usr/local/bin/omnisharp

    curl -LO https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.1/omnisharp-linux-x64-net6.0.tar.gz
    tar -xf omnisharp-linux-x64-net6.0.tar.gz
    rm omnisharp-linux-x64-net6.0.tar.gz

    cd "$CURRENT_DIR"
}

# Install Pyright, the Python LSP implementation used in this setup
install-pyright() {
    sudo apt-get install -y python3 python3-pip
    pip install pyright
}

# Prints a string in green into stdout
info() {
    printf "\033[0;32m%b\033[0m\n" "$1"
}

# Prints a string in red into sterr and exits with status code 1
error() {
    printf "\033[0;31m%b\033[0m\n" "$1" 1>&2
    exit 1
}

info "================================================================================"
info "============================= Neovim Installation =============================="
info "================================================================================"

CURRENT_DIR="$(pwd)"
NVIM_CLONE_DIR="$HOME/.config/nvim/neovim"

check-deps "make" "gcc"

git clone https://github.com/neovim/neovim "$NVIM_CLONE_DIR"

# Removes existing nvim binary
if [[ -e "/usr/local/bin/nvim" ]]; then
    sudo rm /usr/local/bin/nvim
fi

cd "$NVIM_CLONE_DIR"

make CMAKE_BUILD_TYPE="Release"
sudo make install

cd "$CURRENT_DIR"
rm -rf "$NVIM_CLONE_DIR"

info "\n======================== Installing OmniSharp (C# LSP) =========================\n"
install-omnisharp
info "\n============================= OmniSharp installed ==============================\n"

info "\n======================= Installing Pyright (Python LSP) ========================\n"
install-pyright
info "\n============================== Pyright installed ===============================\n"

# check if this is really necessary
PATH=$PATH:$HOME/.local/bin

info "\n================================================================================"
info "======================== Neovim installed successfully ========================="
info "================================================================================\n"

exit 0
