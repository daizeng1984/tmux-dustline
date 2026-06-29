#!/usr/bin/env bash
# Pink Dust color scheme - dusty plum pink
# Main: colour175 (#d787af), all variations lighter

# The copy modes etc
tmux setw -g mode-attr bold
tmux setw -g mode-fg colour181
tmux setw -g mode-bg colour236
# Panes border version > 1.9
tmux set -g pane-border-fg colour237
tmux set -g pane-border-bg colour233
tmux set -g pane-active-border-fg colour218
tmux set -g pane-active-border-bg colour175

# The statusbar
tmux set -g status-bg colour235
tmux set -g status-fg colour175
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
tmux setw -g window-status-fg colour181
tmux setw -g window-status-bg colour235
tmux setw -g window-status-current-fg colour218
tmux setw -g window-status-current-bg colour235
tmux setw -g window-status-current-attr bold
tmux setw -g window-status-attr dim

# Messages
tmux set -g message-attr bold
tmux set -g message-fg colour232
tmux set -g message-bg colour218

# Get option and save them
# Expected input ... status-right "#{dustline_scheme} blabla #{dustline_scheme_separator} blablaagain |"
myscheme_separator_icons_left=""
myscheme_separator_icons_right=""

# Default screen bg color
myscheme_default_mainscreen_background='colour233'
myscheme_prefixon_mainscreen_background='colour225'
# Overall status bar color with prefix on/off
myscheme_prefixon_fg='colour96'
myscheme_prefixon_bg='colour219'
myscheme_prefixoff_fg='colour175'
myscheme_prefixoff_bg='colour235'

# the color of last icon on status-left and first icon on status-right
myscheme_boundary_fg='colour232'
myscheme_boundary_bg='colour218'
myscheme_boundary_prefix_fg='colour96'
myscheme_boundary_prefix_bg='colour225'

myscheme_segment_fg=(
'colour232'
'colour232'
'colour232'
)
myscheme_segment_bg=(
'colour175'
'colour181'
'colour218'
)

myscheme_tab_fg='colour181'
myscheme_tab_bg='colour235'
myscheme_tab_prefixon_fg='colour96'
myscheme_tab_prefixon_bg='colour219'

myscheme_current_tab_fg='colour232'
myscheme_current_tab_bg='colour175'
myscheme_current_tab_prefixon_fg='colour232'
myscheme_current_tab_prefixon_bg='colour219'

# Window style
tmux set -g window-style "fg=colour247,bg=colour235"
tmux set -g window-active-style "fg=colour250,bg=${myscheme_default_mainscreen_background}"
