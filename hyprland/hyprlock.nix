{
  config,
  inputs,
  pkgs,
  ...
}: {
  home.file.".config/hypr/hyprlock.conf".text = ''
    background {
        monitor =
        path = ${../bg.png} # only png supported for now
        color = rgba(25, 20, 20, 1.0)

        # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
        blur_passes = 0 # 0 disables blurring
        blur_size = 7
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    }

    input-field {
        monitor =
        size = 200, 50
        outline_thickness = 0

        dots_size = 0.3 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.3 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true

        outer_color = rgb(000000)
        inner_color = rgb(200, 200, 200)
        font_color = rgb(0, 0, 0)
        fade_on_empty = true
        fade_timeout = 3000
        rounding = 15
        placeholder_text = Your Password # Text rendered in the input box when it's empty.

        check_color = rgb(0, 0, 0)

        fail_color = rgb(204, 34, 34) # if authentication failed, changes outer_color and fail message color
        fail_text = $FAIL <b>($ATTEMPTS)</b> # can be set to empty
        fail_transition = 1000 # transition time in ms between normal outer_color and fail_color
        hide_input = false

        position = 0, -20
        halign = center
        valign = center
        capslock_color = -1
        numlock_color = -1
        bothlock_color = -1 # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false # change color if numlock is off
        shadow_passes = 20
        shadow_size = 10
    }

    label {
        monitor =
        text = cmd[update:1000] echo "$TIME"
        color = rgba(200, 200, 200, 1.0)
        font_size = 55
        font_family = Fira Semibold
        position = -100, -200
        halign = right
        valign = bottom
        shadow_passes = 5
        shadow_size = 10
    }

    label {
        monitor =
        text = $USER
        color = rgba(200, 200, 200, 1.0)
        font_size = 20
        font_family = Fira Semibold
        position = -100, 160
        halign = right
        valign = bottom
        shadow_passes = 5
        shadow_size = 10
    }
  '';
}
