{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.file.".config/hypr/hypridle.conf".text = ''
    general {
        ignore_dbus_inhibit = false
        lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = loginctl lock-session    # lock before suspend.
        after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
    }

    # Screenlock
    listener {
        # HYPRLOCK TIMEOUT
        timeout = 900
        # HYPRLOCK ONTIMEOUT
        on-timeout = loginctl lock-session
    }

    # dpms
    listener {
        # DPMS TIMEOUT
        timeout = 1800
        # DPMS ONTIMEOUT
        on-timeout = hyprctl dispatch dpms off
        # DPMS ONRESUME
        on-resume = hyprctl dispatch dpms on
    }

    # Suspend
    listener {
        # SUSPEND TIMEOUT
        timeout = 3600
        #SUSPEND ONTIMEOUT
        on-timeout = systemctl suspend
    }
  '';
}
