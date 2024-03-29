show_pomodoro() {
    set -g @pomodoro_toggle 'p'                    # Start/pause a Pomodoro/break
    set -g @pomodoro_cancel 'P'                    # Cancel the current session
    set -g @pomodoro_skip '_'                      # Skip a Pomodoro/break

    set -g @pomodoro_mins 25                       # The duration of the Pomodoro
    set -g @pomodoro_break_mins 5                  # The duration of the break after the Pomodoro completes
    set -g @pomodoro_intervals 4                   # The number of intervals before a longer break is started
    set -g @pomodoro_long_break_mins 25            # The duration of the long break
    set -g @pomodoro_repeat 'off'                  # Automatically repeat the Pomodoros?

    set -g @pomodoro_on " 🍅"                      # The formatted output when the Pomodoro is running
    set -g @pomodoro_complete " ✔︎"                 # The formatted output when the break is running
    set -g @pomodoro_pause " ⏸︎"                    # The formatted output when the Pomodoro/break is paused
    set -g @pomodoro_prompt_break " ⏲︎ break?"      # The formatted output when waiting to start a break
    set -g @pomodoro_prompt_pomodoro " ⏱︎ start?"   # The formatted output when waiting to start a Pomodoro

    set -g @pomodoro_menu_position "R"             # The location of the menu relative to the screen
    set -g @pomodoro_sound 'off'                   # Sound for desktop notifications (Run `ls /System/Library/Sounds` for a list of sounds to use on Mac)
    set -g @pomodoro_notifications 'off'           # Enable desktop notifications from your terminal
    set -g @pomodoro_granularity 'off'             # Enables MM:SS (ex: 00:10) format instead of the default (ex: 1m)

    local index=$1
    local icon=$(get_tmux_option "@catppuccin_pomodoro_icon" "󰥔")
    local color=$(get_tmux_option "@catppuccin_pomodoro_color" "$thm_red")
    local text=$(get_tmux_option "@catppuccin_pomodoro_text" "#{pomodoro_status}")

    local module=$( build_status_module "$index" "$icon" "$color" "$text" )

    echo "$module"
}
