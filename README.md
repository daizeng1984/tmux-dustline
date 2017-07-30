# Dustline Tmux Colorscheme Plugin
Tmux Powerline/Airline Style Color Scheme. Native and simple.

![img](./dustline-screenshot.png)

and

![anim](./dustline-animation.gif)

and

![experimental](./dustline-experimental.gif)

## Why
* Status bar highlight when you press prefix
* More colors and new colorschemes and more coming soon!

## Prerequisite 
* tmux and [TPM](https://github.com/tmux-plugins/tpm) (tmux version >=1.9 )
* bash
* Powerfont, Nerdfont (Optional)

## Install 
With tmux plugin manager (TPM) 
```sh
set -g @plugin 'daizeng1984/tmux-dustline'
```

## Example in your .tmux.conf
 
```bash
set -g @dustline_scheme_file "wombat.tmux" # Set your color scheme file
```

For more color scheme files, please take look at [colorscheme folder](https://github.com/daizeng1984/tmux-dustline/tree/master/colorscheme). You can then set status line with as many plugins icons as you like to either left or right status bar

```sh
set -g status-left '#{dustline_scheme_begin}'\
'#[bold] *'\
'#{dustline_scheme_separator}'\
' Host'\
'#{dustline_scheme_end}'

set -g status-right '#{dustline_scheme_begin}'\
'#[bold]CPU:#{cpu_percentage}'\
'#{dustline_scheme_separator}'\
'#{battery_percentage}'\
'#{dustline_scheme_separator}'\
' %m-%d'\
'#{dustline_scheme_end}'
```

## Highlight Active Panel (Experimental)
You can also highlight the active panel by adding:
```sh
set -g @dustline_prefix_background_highlight "1"
```

## Customize Your Own Colorscheme
See wombat.tmux example under ./colorscheme

## License
[MIT](./LICENSE.md)
