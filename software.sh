#!/usr/bin/bash

# Configuration
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly CONFIG_DIR="${HOME}/.config"
readonly FONT_DIR="${HOME}/.local/share/fonts"

# Colors
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Global variables
PACKAGE_MANAGER=""
PRIVILEGE_CMD=""

# Logging functions
log_info() {
    printf "${BLUE}[INFO]${NC} %s\n" "$1"
}

log_success() {
    printf "${GREEN}[SUCCESS]${NC} %s\n" "$1"
}

log_warning() {
    printf "${YELLOW}[WARNING]${NC} %s\n" "$1"
}

log_error() {
    printf "${RED}[ERROR]${NC} %s\n" "$1" >&2
}

# Utility functions
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

is_root() {
    [ "$(id -u)" -eq 0 ]
}

get_user_home() {
    if [ -n "${SUDO_USER:-}" ]; then
        getent passwd "$SUDO_USER" | cut -d: -f6
    else
        echo "$HOME"
    fi
}

detect_privilege_escalation() {
    if command_exists sudo; then
        PRIVILEGE_CMD="sudo"
    elif command_exists doas && [ -f "/etc/doas.conf" ]; then
        PRIVILEGE_CMD="doas"
    else
        PRIVILEGE_CMD="su -c"
    fi
    log_info "Using privilege escalation: $PRIVILEGE_CMD"
}

validate_permissions() {
    if ! groups | grep -qE "(wheel|sudo|root)"; then
        log_error "User must be in wheel, sudo, or root group"
        return 1
    fi

    if [ ! -w "$SCRIPT_DIR" ]; then
        log_error "No write permission to script directory: $SCRIPT_DIR"
        return 1
    fi

    return 0
}

install_core_packages() {
    local packages="git curl wget gcc gnumake vim"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

install_languages_packages() {
    local packages="go node nix"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

install_graphical_packages() {
    local packages="firefox zen chrome calibre discord spotify? obsidian vlc qbittorrent"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

install_myterm_packages() {
    local packages="batcat wezterm kitty tmux eza fd lazygit ripgrep fx yazi tabiew yt-dlp lazydocker github-cli just fastfetch btop jqp tldr neovim"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

install_mypromt_packages() {
    local packages="starship bash bash-completion tar multitail wget unzip fontconfig fzf zoxide"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

install_hyprland_packages() {
    local packages="hyprland waybar hyprlock hypridle hyprpaper rofi dunst hyprpicker flameshot wlogout cliphist hyprsunset"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

# noto-fonts noto-fonts-emoji noto-color-emooji jetbrains-mono font-awesome nerd-fonts-symbols fira-code
install_fonts_packages() {
    local packages="ttf-firacode-nerd woff2-font-awesome"
    local aur_helper=""

    # Install AUR helper if needed
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        log_info "Installing yay AUR helper..."
        $PRIVILEGE_CMD pacman -S --needed --noconfirm base-devel git

        local temp_dir
        temp_dir=$(mktemp -d)
        cd "$temp_dir"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd "$MYBASH_DIR"
        rm -rf "$temp_dir"
        aur_helper="yay"
    fi

    log_info "Installing packages with $aur_helper..."
    $aur_helper -S --needed --noconfirm $packages
}

# install_nerd_font() {
#     local font_name="MesloLGS Nerd Font"
#
#     if fc-list | grep -qi "meslo"; then
#         log_info "Nerd font already installed"
#         return 0
#     fi
#     log_info "Installing $font_name..."
#
#     local font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip"
#     local temp_dir
#     temp_dir=$(mktemp -d)
#
#     if wget -q "$font_url" -O "$temp_dir/Meslo.zip"; then
#         unzip -q "$temp_dir/Meslo.zip" -d "$temp_dir"
#         mkdir -p "$FONT_DIR/MesloLGS"
#         find "$temp_dir" -name "*.ttf" -exec mv {} "$FONT_DIR/MesloLGS/" \;
#         fc-cache -fv >/dev/null 2>&1
#         log_success "Font installed successfully"
#     else
#         log_warning "Failed to download font"
#     fi
#
#     rm -rf "$temp_dir"
# }

# install_fira_font() {
#     local font_name="FiraCode Nerd Font"
#
#     if fc-list | grep -qi "fira"; then
#         log_info "Fira font already installed"
#         return 0
#     fi
#     log_info "Installing $font_name..."
#
#     local font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
#     local temp_dir
#     temp_dir=$(mktemp -d)
#
#     if wget -q "$font_url" -O "$temp_dir/FiraCode.zip"; then
#         unzip -q "$temp_dir/FiraCode.zip" -d "$temp_dir"
#         mkdir -p "$FONT_DIR/FiraCode"
#         find "$temp_dir" -name "*.ttf" -exec mv {} "$FONT_DIR/FiraCode/" \;
#         fc-cache -fv >/dev/null 2>&1
#         log_success "Font installed successfully"
#     else
#         log_warning "Failed to download font"
#     fi
#
#     rm -rf "$temp_dir"
# }

# Main execution
main() {
    log_info "Starting MyPrompt setup..."

    # Validation phase
    # validate_requirements || exit 1
    validate_permissions || exit 1

    # Detection phase
    detect_privilege_escalation

    # Setup phase
    # setup_directories || exit 1

    # Installation phase
    install_core_packages || exit 1
    install_languages_packages || exit 1
    install_fonts_packages || exit 1
    # install_nerd_font
    # install_fira_font

    log_success "Setup completed successfully!"
    log_info "Please restart your shell or run 'source ~/.bashrc' to apply changes"
}

# Run main function
main "$@"
