#!/usr/bin/env bash

DEPENDS=("git" "gum")
DOTFILES_REPO="https://github.com/justanoobcoder/dotfiles"

USERNAME="hiepnh"

error() {
	if command -v gum &>/dev/null; then
		gum style --foreground 1 --bold "Error: $1"
	else
		echo -e "\033[0;31mError: $1"
	fi
	exit 1
}

info() {
	gum style --foreground 4 --bold "$1"
}

warn() {
	gum style --foreground 3 --bold "Warn: $1"
}

check_nixos() {
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		if [ "$ID" != "nixos" ]; then
			error "This script is only for NixOS."
		fi
	else
		error "Can't detect OS, please run this script on NixOS."
	fi
}

check_dependencies() {
	for dep in $DEPENDS; do
		if ! command -v $dep &>/dev/null; then
			error "$dep is not installed, please install it first."
		fi
	done
}

clone_dotfiles() {
	rm -rf .dotfiles
	gum spin --spinner dot --title "Cloning dotfiles..." -- git clone --depth 1 $DOTFILES_REPO .dotfiles
	gum join --horizontal \
		"$(gum style --foreground 2 --bold "Cloned dotfiles successfully, located at ")" \
		"$(gum style --foreground 5 --bold "$(pwd)/.dotfiles")"
}

show_instructions() {
	info "You will need to enter some information before starting the installation."
	info "For each input, you can press Enter to use the default value."
	info "The default value is shown in square brackets []."
	echo "Press Enter to continue..."
	read -r
}

get_input() {
	local username="$(gum input --placeholder="$USERNAME" --header="Enter username [ $USERNAME ]:" --header.foreground="15")"
	if [ -z "$username" ]; then
		return
	fi
	# According to man page of `useradd`:
	# Usernames may contain only lower and upper case letters, digits, underscores, or dashes.
	# They can end with a dollar sign. Dashes are not allowed at the beginning of the username.
	# Fully numeric usernames and usernames . or .. are also disallowed. It is not recommended to use usernames beginning with . character
	while [[ ! "$username" =~ ^[a-zA-Z0-9_][a-zA-Z0-9_.-]*[$]?$ ]] || [[ "$username" =~ ^[0-9]+$ ]]; do
		warn "Invalid username, please enter a valid username."
		username="$(gum input --placeholder="$USERNAME" --header="Enter username [ $USERNAME ]:" --header.foreground="15")"
	done
	USERNAME="$username"
}

main() {
	check_nixos
	check_dependencies
	clone_dotfiles
	show_instructions
	get_input
}

main "$@"
