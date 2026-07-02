. "$HOME/.config/shell/env/colors.sh"

SUFFIX="${RESET}"

blue_italic_echo() {
    PREFIX="${ITALIC}${BLUE}"
    local m="$*"
    printf '%b\n' "${PREFIX}${m}${SUFFIX}"
}

red_echo() {
    PREFIX="${BOLD}${RED}"
    local m="$*"
    printf '%b\n' "${PREFIX}${m}${SUFFIX}"
}
