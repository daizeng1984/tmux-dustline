#!/usr/bin/env bash
# Dune Color Scheme that make you thirsty

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
tmux set -g status-bg colour238
tmux set -g status-fg colour230
tmux set -g status-attr dim
# TODO Adjust based on client width
tmux set -g status-right-length 100
tmux set -g status-left-length 40

# Window
# TODO: make window status configurable?
tmux setw -g window-status-current-format '#{dustline_scheme_begin}'\
'#[bold]#I:#[fg=colour88]#W#[fg=colour0,bold]#F'\
'#{dustline_scheme_end}'
tmux setw -g window-status-format '#{dustline_scheme_begin}'\
'#I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F'\
'#{dustline_scheme_end}'
tmux setw -g window-status-fg colour123
tmux setw -g window-status-bg colour235
tmux setw -g window-status-current-fg colour81
tmux setw -g window-status-current-bg colour238
tmux setw -g window-status-current-attr bold
tmux setw -g window-status-attr dim

# Messages
tmux set -g message-attr bold
tmux set -g message-fg colour232
tmux set -g message-bg colour166

# Get option and save them
# Expected input ... status-right "#{dustline_scheme} blabla #{dustline_scheme_separator} blablaagain |"
myscheme_separator_icons_left="" #
myscheme_separator_icons_right=""

# Default screen bg color
myscheme_default_mainscreen_background='black'
myscheme_prefixon_mainscreen_background='colour215'
# Overall status bar color with prefix on/off
myscheme_prefixon_fg='colour232'
myscheme_prefixon_bg='colour215'
myscheme_prefixoff_fg='colour230'
myscheme_prefixoff_bg='colour238'

# the color of last icon on status-left and first icon on status-right
myscheme_boundary_fg='colour230'
myscheme_boundary_bg='colour137'
myscheme_boundary_prefix_fg='colour215'
myscheme_boundary_prefix_bg='colour130'

myscheme_segment_fg=(
'colour230'
'colour230'
'colour230'
)
myscheme_segment_bg=(
'colour180'
'colour94'
'colour173'
)

myscheme_tab_fg='colour94'
myscheme_tab_bg='colour238'
myscheme_tab_prefixon_fg='colour230'
myscheme_tab_prefixon_bg='colour94'

myscheme_current_tab_fg='colour217'
myscheme_current_tab_bg='colour203'
myscheme_current_tab_prefixon_fg='colour232'
myscheme_current_tab_prefixon_bg='colour217'

# Window style
tmux set -g window-style "fg=colour247,bg=colour236"
tmux set -g window-active-style "fg=colour250,bg=${myscheme_default_mainscreen_background}"

