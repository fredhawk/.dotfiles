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

# Validation functions
validate_requirements() {
    local requirements="curl git"
    local missing=""

    for req in $requirements; do
        if ! command_exists "$req"; then
            missing="$missing $req"
        fi
    done

    if [ -n "$missing" ]; then
        log_error "Missing required commands:$missing"
        return 1
    fi

    return 0
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

# Setup functions
setup_directories() {
    log_info "Setting up directories..."

    mkdir -p "$CONFIG_DIR" "$FONT_DIR"

    log_info "Working from current directory: $SCRIPT_DIR"
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
    local packages="firefox zen chrome calibre discord spotify obsidian vlc qbittorrent"
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

install_myprompt_packages() {
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
    local packages="hyprland waybar hyprlock hypridle hyprpaper wofi dunst hyprpicker flameshot wlogout cliphist hyprsunset"
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

install_fonts_packages() {
    local packages="ttf-firacode-nerd woff2-font-awesome ttf-jetbrains-mono-nerd noto-fonts-emoji ttf-nerd-fonts-symbols noto-fonts"
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

install_nerd_font() {
    local font_name="MesloLGS Nerd Font"

    if fc-list | grep -qi "meslo"; then
        log_info "Nerd font already installed"
        return 0
    fi
    log_info "Installing $font_name..."

    local font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip"
    local temp_dir
    temp_dir=$(mktemp -d)

    if wget -q "$font_url" -O "$temp_dir/Meslo.zip"; then
        unzip -q "$temp_dir/Meslo.zip" -d "$temp_dir"
        mkdir -p "$FONT_DIR/MesloLGS"
        find "$temp_dir" -name "*.ttf" -exec mv {} "$FONT_DIR/MesloLGS/" \;
        fc-cache -fv >/dev/null 2>&1
        log_success "Font installed successfully"
    else
        log_warning "Failed to download font"
    fi

    rm -rf "$temp_dir"
}

install_tpm() {
    local tpm_dir="${HOME}/.tmux/plugins/tpm/"
    if [[ -d "$tpm_dir" ]]; then
        log_info "TPM already installed"
        return 0
    fi

    log_info "Installing TPM..."
    if git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; then
        log_success "TPM installed successfully"
    else
        log_error "Failed to install TPM"
        return 1
    fi
}

# Configuration functions
setup_gitconfig() {
    local user_home
    user_home=$(get_user_home)
    local config_file="$user_home/.gitconfig"

    if [ -f "$SCRIPT_DIR/myterm/.gitconfig" ]; then
        ln -sf "$SCRIPT_DIR/myterm/.gitconfig" "$config_file"
        log_success ".gitconfig linked"
    else
        log_warning ".gitconfig file not found"
    fi
}

setup_wezterm_config() {
    local user_home
    user_home=$(get_user_home)
    local config_file="$user_home/.wezterm.lua"

    if [ -f "$SCRIPT_DIR/myterm/.wezterm.lua" ]; then
        ln -sf "$SCRIPT_DIR/myterm/.wezterm.lua" "$config_file"
        log_success "Wezterm config linked"
    else
        log_warning ".wezterm.lua file not found"
    fi
}

setup_tmux_config() {
    local user_home
    user_home=$(get_user_home)
    local config_file="$user_home/.tmux.conf"

    if [ -f "$SCRIPT_DIR/myterm/.tmux.conf" ]; then
        ln -sf "$SCRIPT_DIR/myterm/.tmux.conf" "$config_file"
        log_success "Tmux config linked"
    else
        log_warning ".tmux.conf file not found"
    fi
}

setup_nvim_config() {
    local user_home
    user_home=$(get_user_home)
    local config_dir="$user_home/.config/nvim"
    # local config_file="$user_home/.tmux.conf"

    if [ -f "$SCRIPT_DIR/myterm/nvim" ]; then
        ln -sf "$SCRIPT_DIR/myterm/nvim" "$config_dit"
        log_success "Neovim config linked"
    else
        log_warning "Neovim not found"
    fi
}

setup_bash_config() {
    local user_home
    user_home=$(get_user_home)
    local bashrc="$user_home/.bashrc"
    local bash_profile="$user_home/.bash_profile"
    local starship_config="$user_home/.config/starship.toml"

    # Backup existing bashrc
    if [ -f "$bashrc" ]; then
        log_info "Backing up existing .bashrc"
        mv "$bashrc" "$bashrc.backup.$(date +%Y%m%d_%H%M%S)"
    fi

    # Link new configurations
    if [ -f "$SCRIPT_DIR/myprompt/.bashrc" ]; then
        ln -sf "$SCRIPT_DIR/myprompt/.bashrc" "$bashrc"
        log_success "Bashrc configuration linked"
    else
        log_error "Bashrc template not found"
        return 1
    fi

    if [ -f "$SCRIPT_DIR/myprompt/starship.toml" ]; then
        ln -sf "$SCRIPT_DIR/myprompt/starship.toml" "$starship_config"
        log_success "Starship configuration linked"
    else
        log_warning "Starship config template not found"
    fi

    # Create bash_profile if needed
    if [ ! -f "$bash_profile" ]; then
        cat >"$bash_profile" <<'EOF'
# Source bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
EOF
        log_success "Created .bash_profile"
    fi
}

# Main execution
main() {
    log_info "Starting System setup..."

    # Validation phase
    validate_requirements || exit 1
    validate_permissions || exit 1

    # Detection phase
    detect_privilege_escalation

    # Setup phase
    setup_directories || exit 1

    # Installation phase
    install_tpm || exit 1
    install_core_packages || exit 1
    install_languages_packages || exit 1
    install_myterm_packages || exit 1
    install_myprompt_packages || exit 1
    install_graphical_packages || exit 1
    install_fonts_packages || exit 1
    install_nerd_font

    # Configuration phase
    setup_bash_config || exit 1
    setup_gitconfig || exit 1
    setup_wezterm_config || exit 1
    setup_tmux_config || exit 1
    setup_nvim_config || exit 1

    log_success "Setup completed successfully!"
    log_info "Please restart your system to apply changes and log into Hyprland."
}

# Run main function
main "$@"
