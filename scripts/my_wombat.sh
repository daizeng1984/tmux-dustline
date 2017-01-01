#!/usr/bin/env bash
# The copy modes etc
tmux setw -g mode-attr bold
tmux setw -g mode-fg colour228
tmux setw -g mode-bg colour238
# Panes border version > 1.9
tmux set -g pane-border-fg colour238
tmux set -g pane-border-bg colour235
tmux set -g pane-active-border-fg colour51
tmux set -g pane-active-border-bg colour32

# The statusbar
tmux set -g status-position top
tmux set -g status-bg colour238
tmux set -g status-fg colour230
tmux set -g status-attr dim
tmux set -g status-left '#{?client_prefix,#[bg=colour117],#[bg=colour192]}#[fg=colour238]#(whoami)@#h#[reverse]#[noreverse]'
tmux set -g status-right-length 100
tmux set -g status-left-length 40
# #[fg=colour186]#[fg=colour232,bg=colour186]#{net_speed}
tmux set -g status-right '#{?client_prefix,#[bg=colour117],#[bg=colour192]}#[fg=colour238]#[reverse]#[noreverse]#[bold]CPU:#{cpu_percentage}#[fg=colour228]#[fg=colour232,bg=colour228,bold]#{online_status}#[fg=colour222]#[fg=colour232,bg=colour222,bold]#{battery_icon}#{battery_percentage}#[fg=colour216]#[fg=colour232,bg=colour216]%Y-%m-%d %a %H:%M '

# Online ICON
tmux set -g @online_icon "#[fg=colour034,bold]▲▼"
tmux set -g @offline_icon "#[fg=colour196,bold]  "
# Battery status
tmux set -g @batt_charged_icon "#[fg=colour034]"
tmux set -g @batt_charging_icon "#[fg=colour232]"
tmux set -g @batt_discharging_icon "#[fg=colour167]"
tmux set -g @batt_attached_icon "#[fg=colour232]"

# window status

tmux setw -g window-status-fg colour123
tmux setw -g window-status-bg colour235
tmux setw -g window-status-current-fg colour81
tmux setw -g window-status-current-bg colour238
tmux setw -g window-status-current-attr bold
tmux setw -g window-status-attr dim
tmux setw -g window-status-current-format '#[fg=colour123,bg=colour238]#[bg=colour123] #[fg=colour210]#I:#[fg=colour232,bold]#W#[fg=colour0,bold]#F#[fg=colour123,bg=colour238]'
tmux setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

# Bell
# set-option -g bell-action any
# set-option -g visual-bell on

# Messages
tmux set -g message-attr bold
tmux set -g message-fg colour232
tmux set -g message-bg colour166

