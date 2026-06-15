. "$HOME/.config/shell/env/colors.sh"

PREFIX="${ITALIC}${BLUE}"
SUFFIX="${RESET}"

blue_italic_echo() {
    local m="$*"
    printf '%b\n' "${PREFIX}${m}${SUFFIX}"
}
