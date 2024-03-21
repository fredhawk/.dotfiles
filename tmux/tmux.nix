{config, inputs, pkgs, ...}:
{
programs.tmux = {
enable = true;
shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
historyLimit = 100000;
plugins = with pkgs;
[
tmuxPlugins.sensible
tmuxPlugins.vim-tmux-navigator
# must be before continuum edits right status bar
{
    plugin = tmuxPlugins.catppuccin;
    extraConfig = '' 
    set -g @catppuccin_flavour 'frappe'
    set -g @catppuccin_window_tabs_enabled on
    set -g @catppuccin_date_time "%H:%M"
    set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W"

set -g @catppuccin_status_modules_right "directory session"
set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_right_separator_inverse "no"
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_directory_text "#{pane_current_path}"
    '';
}
{
    plugin = tmuxPlugins.resurrect;
    extraConfig = ''
    set -g @resurrect-strategy-vim 'session'
    set -g @resurrect-strategy-nvim 'session'
    set -g @resurrect-capture-pane-contents 'on'
    '';
}
{
    plugin = tmuxPlugins.continuum;
    extraConfig = ''
    set -g @continuum-restore 'on'
    set -g @continuum-boot 'on'
    set -g @continuum-save-interval '10'
    '';
}

];
extraConfig = ''
set -ga terminal-overrides ",xterm-256color*:Tc"
set -s escape-time 0

unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded."
set -g base-index 1

# Move the status bar to the top.
set-option -g status-position top

bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

set -g mouse on

# vim-like pane switching
bind -r ^ last-window
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R

# Bind Alt+h/l to navigate to previous/next window and create and kill windows
bind -n M-h previous-window
bind -n M-l next-window
bind -n M-c new-window
bind -n M-x kill-window
'';
};
}
