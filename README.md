# Tmux Wombat/airline Style Color Scheme
"Native" color scheme simply on modern tmux

# Prerequisite 
tmux
bash
*Powerfont

# Support Customization
See wombat example under ./colorscheme

# Example to configure on

```bash
set -g @my_wombatscheme_file "wombat.tmux" # Set your color scheme file

# customize status line ... could it be better?
set -g status-right '#{my_wombatscheme_begin}'\
'#[bold]CPU:#{cpu_percentage}'\
'#{my_wombatscheme_separator}'\
'#{battery_icon}#{battery_percentage}'\
'#{my_wombatscheme_separator}'\
'%Y-%m-%d %a %H:%M'\
'#{my_wombatscheme_end}'

```

- [ ] Add screenshot
- [ ] More refactoring

# License
TODO
