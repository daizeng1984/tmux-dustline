#!/usr/bin/env bash
# Wombat color scheme
# A good resource to lookup terminal color
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# A good resource to find a unicode symbol
# https://unicode-table.com/en/#latin-extended-b
# https://unicode-table.com/en/blocks/dingbats/
# https://github.com/ryanoasis/nerd-fonts
#  and then try it out in your shell with: echo -e "\ue0a0\ue0a1\ue0a2\ue0b0\ue0b1\ue0b2\ue0b3

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
'#[bold]#I:#[fg=colour232]#W#[fg=colour0,bold]#F'\
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
myscheme_separator_icons_left="" #
myscheme_separator_icons_right="" #

# Default screen bg color
myscheme_default_mainscreen_background='black'
myscheme_prefixon_mainscreen_background='colour107'
# Overall status bar color with prefix on/off
myscheme_prefixon_fg='colour232'
myscheme_prefixon_bg='colour32'
myscheme_prefixoff_fg='colour230'
myscheme_prefixoff_bg='colour238'

# the color of last icon on status-left and first icon on status-right
myscheme_boundary_fg='colour232'
myscheme_boundary_bg='colour192'
myscheme_boundary_prefix_fg='colour232'
myscheme_boundary_prefix_bg='colour117'

myscheme_segment_fg=(
'colour232'
'colour232'
'colour232'
)
myscheme_segment_bg=(
'colour228'
'colour222'
'colour216'
)

myscheme_tab_fg='colour117'
myscheme_tab_bg='colour235'
myscheme_tab_prefixon_fg='colour117'
myscheme_tab_prefixon_bg='colour24'

myscheme_current_tab_fg='colour67'
myscheme_current_tab_bg='colour107'
myscheme_current_tab_prefixon_fg='colour202'
myscheme_current_tab_prefixon_bg='colour123'

# Window style
tmux set -g window-style "fg=colour247,bg=colour236"
tmux set -g window-active-style "fg=colour250,bg=${myscheme_default_mainscreen_background}"
