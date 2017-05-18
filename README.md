# Tmux powerline/airline Style Color Scheme
"Native" color scheme simply on modern tmux

# Prerequisite 
tmux
bash
*Powerfont or Nerdfont

# Support Customization
See wombat example under ./colorscheme

# Example to configure on

```bash
set -g @dustline_scheme_file "wombat.tmux" # Set your color scheme file

# customize status line
set -g status-right '#{dustline_scheme_begin}'\
'#[bold]CPU:#{cpu_percentage}'\
'#{dustline_scheme_separator}'\
'#{battery_icon}#{battery_percentage}'\
'#{dustline_scheme_separator}'\
'%Y-%m-%d %a %H:%M'\
'#{dustline_scheme_end}'

```

# License
TODO
