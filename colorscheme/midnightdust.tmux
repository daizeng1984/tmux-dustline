#!/usr/bin/env bash
# Midnight Dust color scheme - deep midnight blue
# Main: colour25 (#005faf), all variations darker

# The copy modes etc
tmux setw -g mode-attr bold
tmux setw -g mode-fg colour111
tmux setw -g mode-bg colour234
# Panes border version > 1.9
tmux set -g pane-border-fg colour236
tmux set -g pane-border-bg colour232
tmux set -g pane-active-border-fg colour69
tmux set -g pane-active-border-bg colour25

# The statusbar
tmux set -g status-bg colour234
tmux set -g status-fg colour69
tmux set -g status-attr dim
# TODO Adjust based on client width
tmux set -g status-right-length 100
tmux set -g status-left-length 40

# Window
# TODO: make window status configurable?
tmux setw -g window-status-current-format '#{dustline_scheme_begin}'\
'#[bold]#I:#[fg=colour153]#W#[fg=colour230,bold]#F'\
'#{dustline_scheme_end}'
tmux setw -g window-status-format '#{dustline_scheme_begin}'\
'#I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F'\
'#{dustline_scheme_end}'
tmux setw -g window-status-fg colour69
tmux setw -g window-status-bg colour234
tmux setw -g window-status-current-fg colour111
tmux setw -g window-status-current-bg colour234
tmux setw -g window-status-current-attr bold
tmux setw -g window-status-attr dim

# Messages
tmux set -g message-attr bold
tmux set -g message-fg colour153
tmux set -g message-bg colour25

# Get option and save them
# Expected input ... status-right "#{dustline_scheme} blabla #{dustline_scheme_separator} blablaagain |"
myscheme_separator_icons_left=""
myscheme_separator_icons_right=""

# Default screen bg color
myscheme_default_mainscreen_background='colour232'
myscheme_prefixon_mainscreen_background='colour17'
# Overall status bar color with prefix on/off
myscheme_prefixon_fg='colour153'
myscheme_prefixon_bg='colour18'
myscheme_prefixoff_fg='colour69'
myscheme_prefixoff_bg='colour234'

# the color of last icon on status-left and first icon on status-right
myscheme_boundary_fg='colour153'
myscheme_boundary_bg='colour19'
myscheme_boundary_prefix_fg='colour153'
myscheme_boundary_prefix_bg='colour18'

myscheme_segment_fg=(
'colour153'
'colour153'
'colour153'
)
myscheme_segment_bg=(
'colour25'
'colour19'
'colour18'
)

myscheme_tab_fg='colour69'
myscheme_tab_bg='colour234'
myscheme_tab_prefixon_fg='colour153'
myscheme_tab_prefixon_bg='colour18'

myscheme_current_tab_fg='colour153'
myscheme_current_tab_bg='colour25'
myscheme_current_tab_prefixon_fg='colour153'
myscheme_current_tab_prefixon_bg='colour17'

# Window style
tmux set -g window-style "fg=colour244,bg=colour234"
tmux set -g window-active-style "fg=colour250,bg=${myscheme_default_mainscreen_background}"
