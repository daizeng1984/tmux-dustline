#!/usr/bin/env bash
# Scheme
# TODO change these to use funciton
# Load scheme file
# Stolen from https://github.com/tmux-plugins/tmux-battery
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
get_tmux_window_option() {
    get_tmux_option ${1} ' ' '-w'
}

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
load_scheme_file() {
    source "${CURRENT_DIR}/../colorscheme/${1}"
}
get_myscheme_settings() {
    schemefile=$(get_tmux_option "@my_wombatscheme_file")
}

get_myscheme_settings
load_scheme_file $schemefile


# Get status_fg and status_bg
status_fg="$(get_tmux_option "status-style")"
status_fg="$(echo $status_fg | sed -e 's/fg[\s]*=\([^,]*\).*/\1/')"
status_bg="$(get_tmux_option "status-style")"
status_bg="$(echo $status_bg | sed -e 's/bg[\s]*=\([^,]*\).*/\1/')"


prefix_color() {
    echo "#{?client_prefix,${1},${2}}"
}

statusbar_prefix_header() {
    echo "#{?client_prefix,#(tmux set -g status-fg ${myscheme_prefixon_fg} && tmux set -g status-bg ${myscheme_prefixon_bg}),#(tmux set -g status-fg ${myscheme_prefixoff_fg} && tmux set -g status-bg ${myscheme_prefixoff_bg})}"
}

render_myscheme() {
    
    # get the status option
    local option_value="$(get_tmux_option "${1}")"
    local wombat_chunk="$(echo $option_value | sed -e 's/.*\#{[\s]*my_wombatscheme_begin[\s]*}\(.*\)\#{[\s]*my_wombatscheme_end[\s]*}.*/\1/')"
    #TODO use sed to split the words and escape backslash if possible
    local list_of_icons=$(echo $wombat_chunk | sed -e 's/\#{[\s]*my_wombatscheme_separator[\s]*}/\\n/g')
    IFS=$'\n'
    list_of_icons=($(echo -e $list_of_icons))
    unset IFS
    local all_interpolated=''
    local icon_begin_fg=''
    local icon_begin_bg=''
    local icon_end_fg=''
    local icon_end_bg=''
    local separator=''
    available_color_num=${#myscheme_segment_fg[@]}
    previous_fg="$(prefix_color $myscheme_prefixon_fg $myscheme_prefixoff_fg)"
    previous_bg="$(prefix_color $myscheme_prefixon_bg $myscheme_prefixoff_bg)"
    
    #echo "$previous_fg;$previous_bg"
    for ((i=0; i<${#list_of_icons[@]}; i++)); do
        if [[ "${1}" = "status-left" ]]; then
            # TODO status_fg or prefixoff_fg
            separator=${myscheme_separator_icons_right}
            index=$((${#list_of_icons[@]} - $i - 1))
        else
            separator=${myscheme_separator_icons_left}
            index=$i
        fi
        icon="${list_of_icons[$index]}"

        if [ $i != 0 ] ; then
            current_fg="${myscheme_segment_fg[$(($index % ${available_color_num}))]}"
            current_bg="${myscheme_segment_bg[$(($index % ${available_color_num}))]}"
        else
            current_fg="$(prefix_color $myscheme_boundary_prefix_fg $myscheme_boundary_fg)"
            current_bg="$(prefix_color $myscheme_boundary_prefix_bg $myscheme_boundary_bg)"
        fi

        if [[ "${1}" = "status-left" ]]; then
            all_interpolated="#[fg=${current_fg}]#[bg=${current_bg}]${icon}#[fg=${current_bg}]#[bg=${previous_bg}]${separator}#[fg=${previous_fg}]#[bg=${previous_bg}]${all_interpolated}"
        else
            all_interpolated="${all_interpolated}#[fg=${current_bg}]#[bg=${previous_bg}]${separator}#[fg=${current_fg}]#[bg=${current_bg}]${icon}"
        fi
        previous_fg=$current_fg
        previous_bg=$current_bg
    done

    echo "$all_interpolated"
}

# update status
newstatus="$(render_myscheme 'status-left')"
tmux set -g status-left "$(statusbar_prefix_header)$newstatus"
newstatus="$(render_myscheme 'status-right')"
tmux set -g status-right "$newstatus"

render_tab() {
    local option=${1} # -current or ''
    # get the status option
    #local option_value=$(get_tmux_window_option window-status-${option}-style)
    #tab_fg="$(echo $option_value | sed -e 's/fg[\s]*=\([^,]*\).*/\1/')"
    #tab_bg="$(echo $option_value | sed -e 's/bg[\s]*=\([^,]*\).*/\1/')"

    # get format
    local option_value=$(get_tmux_window_option window-status${option}-format)
    #echo $option_value
    local wombat_chunk="$(echo $option_value | sed -e 's/.*\#{[\s]*my_wombatscheme_begin[\s]*}\(.*\)\#{[\s]*my_wombatscheme_end[\s]*}.*/\1/')"
    #echo $wombat_chunk
    separator=${myscheme_separator_icons_right}
    prevtab_bg="$(prefix_color $myscheme_prefixon_bg $myscheme_prefixoff_bg)"
    if [[ $option != "-current" ]]; then
        tab_fg="$(prefix_color $myscheme_tab_prefixon_fg $myscheme_tab_fg)"
        tab_bg="$(prefix_color $myscheme_tab_prefixon_bg $myscheme_tab_bg)"
    else
        tab_fg="$(prefix_color $myscheme_current_tab_prefixon_fg $myscheme_current_tab_fg)"
        tab_bg="$(prefix_color $myscheme_current_tab_prefixon_bg $myscheme_current_tab_bg)"
    fi
    echo "#[fg=${prevtab_bg}]#[bg=${tab_bg}]${separator}#[fg=${tab_fg}]#[bg=${tab_bg}]${wombat_chunk}#[fg=${tab_bg}]#[bg=${prevtab_bg}]${separator}"
}

newtab=$(render_tab -current)
tmux setw -g window-status-current-format "$newtab"
newtab=$(render_tab)
tmux setw -g window-status-format "$newtab"

