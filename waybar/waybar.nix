{
  config,
  inputs,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];

        modules-right = [
          "memory"
          "temperature"
          "pulseaudio"
          "bluetooth"
          "network"
          "battery"
        ];
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "all-outputs" = true;
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };
        "clock" = {
          "format" = "<span color='#f2d5cf'> </span>{:%H:%M}";
          "tooltip" = true;
          "tooltip-format" = "{:%Y-%m-%d %a}";
        };

        "cpu" = {"format" = "<span color='#b4befe'>  </span>{usage}%";};
        "memory" = {
          "interval" = 1;
          "format" = "<span color='#b4befe'>  </span>{used:0.1f}G/{total:0.1f}G";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "<span color='#b4befe'>{icon}</span> {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };
        "pulseaudio" = {
          "format" = "<span color='#85c1dc'>{icon}</span> {volume}%";
          "format-muted" = "";
          "tooltip" = false;
          "format-icons" = {
            "headphone" = "";
            "default" = ["" "" "󰕾" "󰕾" "󰕾" "" "" ""];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
        };
        "bluetooth" = {
          "format" = "<span color='#b4befe'></span> {status}";
          "format-disabled" = "";
          "format-connected" = "<span color='#a6d189'></span> {num_connections}";
          "tooltip-format" = "{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}   {device_address}";
        };
        "network" = {
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-full" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["" "" "" "" ""];
        };
        "battery#bat2" = {
          "bat" = "BAT2";
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = ["" "" ""];
        };
      };
    };
    style = ''
      @import "${./frappe.css}";
           * {
             border: none;
             font-family: 'Fira Code', 'Symbols Nerd Font Mono';
             font-size: 15px;
             font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
             min-height: 35px;
           }

           window#waybar {
             background: transparent;
           }

           #custom-nix,
           #workspaces {
             border-radius: 1rem;
             background-color: @Base;
             color: @Subtext0;
             margin-top: 10px;
             margin-right: 15px;
             padding-top: 1px;
             padding-left: 10px;
             padding-right: 10px;
           }

           #custom-nix {
             font-size: 20px;
             margin-left: 15px;
             color: #b4befe;
           }

           #custom-cava-internal {
             padding-left: 10px;
             padding-right: 10px;
             padding-top: 1px;
             font-family: "Hack Nerd Font";
             color: #b4befe;
             background-color: @Base;
             margin-top: 15px;
             border-radius: 10px;
           }

           #workspaces button.active {
             background: @Base;
             color: @teal;
           }

           #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #cpu, #memory, #temperature {
             border-radius: 1rem;
             background-color: @Base;
             color: @text;
             margin-top: 10px;
             padding-left: 10px;
             padding-right: 10px;
             margin-right: 15px;
           }

           #backlight, #bluetooth {
             border-top-right-radius: 0;
             border-bottom-right-radius: 0;
             padding-right: 5px;
             margin-right: 0
           }

           #pulseaudio, #network {
             border-top-left-radius: 0;
             border-bottom-left-radius: 0;
             padding-left: 5px;
           }

           #network {
      color: @Maroon;
           }

           #clock {
             margin-right: 0;
      color: @Rosewater;
      font-weight: 500;
           }
    '';
  };
}
