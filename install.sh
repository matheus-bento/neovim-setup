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
    sudo mkdir -v -p /usr/local/bin/omnisharp 2>/dev/null
    cd /usr/local/bin/omnisharp

    sudo curl -LO https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.1/omnisharp-linux-x64-net6.0.tar.gz
    sudo tar -xvf omnisharp-linux-x64-net6.0.tar.gz
    sudo rm -v omnisharp-linux-x64-net6.0.tar.gz

    cd "$CURRENT_DIR"
}

# Installs Pyright, the Python LSP implementation used in this setup
install-pyright() {
    pip install pyright
}

# Installs tsserver, the Typescript/Javascript LSP implementation used in this setup
install-tsserver() {
    sudo npm install -g typescript typescript-language-server
}

# Installs win32yank.exe to give neovim access to the system clipboard on WSL systems
install-win32yank() {
    curl -Lo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
    chmod +x /tmp/win32yank.exe
    sudo mv -v /tmp/win32yank.exe /usr/local/bin/
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

check-deps "cmake" "gcc" "unzip" "pip" "npm"

git clone https://github.com/neovim/neovim "$NVIM_CLONE_DIR"

# Removes existing nvim binary
if [[ -e "/usr/local/bin/nvim" ]]; then
    sudo rm -v /usr/local/bin/nvim
fi

cd "$NVIM_CLONE_DIR"

make CMAKE_BUILD_TYPE="Release"
sudo make install

cd "$CURRENT_DIR"
rm -rf -v "$NVIM_CLONE_DIR"

# Checks if system is running on WSL
if [[ ! -z "$(uname -r | grep -i "Microsoft")" ]]; then
    info "\n============ Installing win32yank.exe (Clipboard support for WSL) ==============\n"
    install-win32yank
    info "\n=========================== win32yank.exe installed ============================\n"
fi

info "\n======================== Installing OmniSharp (C# LSP) =========================\n"
install-omnisharp
info "\n============================= OmniSharp installed ==============================\n"

info "\n======================= Installing Pyright (Python LSP) ========================\n"
install-pyright
info "\n============================== Pyright installed ===============================\n"

info "\n====== Installing typescript-language-server (Typescript/Javascript LSP) =======\n"
install-tsserver
info "\n=================== typescript-language-server installed =======================\n"

PATH=$PATH:$HOME/.local/bin

info "\n================================================================================"
info "======================== Neovim installed successfully ========================="
info "================================================================================\n"

exit 0
