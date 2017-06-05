#!/usr/bin/env bash
# Dustline color scheme for tmux, the name is to honor powerline and airline
# This work is mainly inspired by https://coderwall.com/p/trgyrq/make-your-tmux-status-bar-responsive

# constants
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# include helpers
source "${CURRENT_DIR}/helpers.sh"

# load 
load_scheme_file() { 
    source "${CURRENT_DIR}/../colorscheme/${1}"
}
# get color scheme file you set
get_myscheme_settings() {
    schemefile=$(get_tmux_option "@dustline_scheme_file")
}
get_myscheme_settings
load_scheme_file $schemefile

# Get status_fg and status_bg old value
status_fg="$(get_tmux_option "status-style")"
status_fg="$(echo $status_fg | sed -e 's/fg[\s]*=\([^,]*\).*/\1/')"
status_bg="$(get_tmux_option "status-style")"
status_bg="$(echo $status_bg | sed -e 's/bg[\s]*=\([^,]*\).*/\1/')"

# Prefix pressed/unpressed 2 status
prefix_color() {
    echo "#{?client_prefix,${1},${2}}"
}

# Status bar's prefix header
statusbar_prefix_header() {
    echo "#{?client_prefix,#(tmux set -g status-bg ${myscheme_prefixon_bg}),#(tmux set -g status-bg ${myscheme_prefixoff_bg})}"
}

# Render out the status scheme (left and right except tab)
render_myscheme() {
    # get the status option
    local option_value="$(get_tmux_option "${1}")"
    local dustline_chunk="$(echo $option_value | sed -e 's/.*\#{[\s]*dustline_scheme_begin[\s]*}\(.*\)\#{[\s]*dustline_scheme_end[\s]*}.*/\1/')"
    #TODO: use sed to split the words and escape backslash if possible
    local list_of_icons=$(echo $dustline_chunk | sed -e 's/\#{[\s]*dustline_scheme_separator[\s]*}/\\n/g')
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

# Render tab
render_tab() {
    local option=${1} # -current or ''
    # get the status option
    #local option_value=$(get_tmux_window_option window-status-${option}-style)
    #tab_fg="$(echo $option_value | sed -e 's/fg[\s]*=\([^,]*\).*/\1/')"
    #tab_bg="$(echo $option_value | sed -e 's/bg[\s]*=\([^,]*\).*/\1/')"

    # get format
    local option_value=$(get_tmux_window_option window-status${option}-format)
    #echo $option_value
    local dustline_chunk="$(echo $option_value | sed -e 's/.*\#{[\s]*dustline_scheme_begin[\s]*}\(.*\)\#{[\s]*dustline_scheme_end[\s]*}.*/\1/')"
    #echo $dustline_chunk
    separator=${myscheme_separator_icons_right}
    prevtab_bg="$(prefix_color $myscheme_prefixon_bg $myscheme_prefixoff_bg)"
    if [[ $option != "-current" ]]; then
        tab_fg="$(prefix_color $myscheme_tab_prefixon_fg $myscheme_tab_fg)"
        tab_bg="$(prefix_color $myscheme_tab_prefixon_bg $myscheme_tab_bg)"
    else
        tab_fg="$(prefix_color $myscheme_current_tab_prefixon_fg $myscheme_current_tab_fg)"
        tab_bg="$(prefix_color $myscheme_current_tab_prefixon_bg $myscheme_current_tab_bg)"
    fi
    echo "#[fg=${prevtab_bg}]#[bg=${tab_bg}]${separator}#[fg=${tab_fg}]#[bg=${tab_bg}]${dustline_chunk}#[fg=${tab_bg}]#[bg=${prevtab_bg}]${separator}"
}

newtab=$(render_tab -current)
tmux setw -g window-status-current-format "$newtab"
newtab=$(render_tab)
tmux setw -g window-status-format "$newtab"

# TODO: Window Style
# tmux set -g window-style '#{?client_prefix, bg=colour236, bg=black}'
# tmux set -g window-active-style 'bg=black'
