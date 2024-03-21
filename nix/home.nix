{ config
, pkgs
, ...
}: {
  imports = [
    ./git/git.nix
    ./hyprland/hyprland.nix
    ./waybar/waybar.nix
    ./dunst/dunst.nix
    ./rofi/rofi.nix
    ./hyprland/hyprlock.nix
    ./hyprland/hypridle.nix
    ./swappy/swappy.nix
    ./tmux/tmux.nix
    ./nvim/nvim.nix
  ];
  # The user and path it manages
  home.username = "skyhawk";
  home.homeDirectory = "/home/skyhawk";

  # Let home-manager manage itself
  programs.home-manager.enable = true;

  # List of packages
  home.packages = with pkgs; [
    eza
    wezterm
    neovim
    starship
    vlc
    qbittorrent
    tmux
    tmuxinator
    gcc
    zig
    lazygit
    lazydocker
    stow
    rustc
    cargo
    nodejs
    alejandra
    lua
    gh
  ];

  home.stateVersion = "23.11";

  # Theming
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "frappe";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  # Software configs
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.path = "$HOME/zsh/history";
    shellAliases = {
      e = "eza --icons -F -H --group-directories-first --git -l -al";
      v = "nvim";
      tls = "tmux ls";
      tmk = "tmux kill-session -t";
      mux = "tmuxinator";
      muxs = "tmuxinator start";
      muxn = "tmuxinator new";
      muxl = "tmuxinator new --local";
      lg = "lazygit";
    };
    initExtra = ''
      export EDITOR="nvim"
      # Start up Starship shell
      eval "$(starship init zsh)"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "z" "docker" "docker-compose" ];
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")
      local config = {}

      config.color_scheme = "Catppuccin Frappe"
      config.enable_tab_bar = false
      config.font = wezterm.font("Fira Code Nerd Font")
      config.font_size = 12.5
      config.line_height = 1.2
      config.window_background_opacity = 0.8

      return config
    '';
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship/starship.toml;
  };
}
