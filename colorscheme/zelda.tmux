#!/usr/bin/env bash
# Zelda: Breath of the Wild color scheme
# Open sky blue, Sheikah teal, Hyrule earth, shrine amber
# A good resource to lookup terminal color
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# The copy modes etc
tmux setw -g mode-attr bold
tmux setw -g mode-fg colour75
tmux setw -g mode-bg colour236
# Panes border version > 1.9
tmux set -g pane-border-fg colour237
tmux set -g pane-border-bg colour233
tmux set -g pane-active-border-fg colour75
tmux set -g pane-active-border-bg colour31

# The statusbar
tmux set -g status-bg colour236
tmux set -g status-fg colour75
tmux set -g status-attr dim
# TODO Adjust based on client width
tmux set -g status-right-length 100
tmux set -g status-left-length 40

# Window
# TODO: make window status configurable?
tmux setw -g window-status-current-format '#{dustline_scheme_begin}'\
'#[bold]#I:#[fg=colour232]#W#[fg=colour0,bold]#F'\
'#{dustline_scheme_end}'
tmux setw -g window-status-format '#{dustline_scheme_begin}'\
'#I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F'\
'#{dustline_scheme_end}'
tmux setw -g window-status-fg colour107
tmux setw -g window-status-bg colour236
tmux setw -g window-status-current-fg colour75
tmux setw -g window-status-current-bg colour236
tmux setw -g window-status-current-attr bold
tmux setw -g window-status-attr dim

# Messages
tmux set -g message-attr bold
tmux set -g message-fg colour232
tmux set -g message-bg colour172

# Get option and save them
# Expected input ... status-right "#{dustline_scheme} blabla #{dustline_scheme_separator} blablaagain |"
myscheme_separator_icons_left="" #
myscheme_separator_icons_right="" #

# Default screen bg color
myscheme_default_mainscreen_background='colour17'
myscheme_prefixon_mainscreen_background='colour52'
# Overall status bar color with prefix on/off
myscheme_prefixon_fg='colour232'
myscheme_prefixon_bg='colour172'
myscheme_prefixoff_fg='colour75'
myscheme_prefixoff_bg='colour236'

# the color of last icon on status-left and first icon on status-right
myscheme_boundary_fg='colour232'
myscheme_boundary_bg='colour75'
myscheme_boundary_prefix_fg='colour232'
myscheme_boundary_prefix_bg='colour172'

myscheme_segment_fg=(
'colour75'
'colour232'
'colour232'
)
myscheme_segment_bg=(
'colour22'
'colour101'
'colour31'
)

myscheme_tab_fg='colour107'
myscheme_tab_bg='colour236'
myscheme_tab_prefixon_fg='colour232'
myscheme_tab_prefixon_bg='colour52'

myscheme_current_tab_fg='colour232'
myscheme_current_tab_bg='colour75'
myscheme_current_tab_prefixon_fg='colour232'
myscheme_current_tab_prefixon_bg='colour172'

# Window style
tmux set -g window-style "fg=colour247,bg=colour236"
tmux set -g window-active-style "fg=colour250,bg=${myscheme_default_mainscreen_background}"
