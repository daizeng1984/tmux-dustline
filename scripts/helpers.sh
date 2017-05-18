# This one is stolen from https://github.com/tmux-plugins/tmux-battery
get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv ${3} "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

# Get tmux window options
get_tmux_window_option() {
    get_tmux_option ${1} ' ' '-w'
}

