#!/usr/bin/env bash

DEPENDS=("git" "gum")

error() {
	echo -e "\033[0;31mError: $1"
	exit 1
}

check_dependencies() {
	for dep in $DEPENDS; do
		if ! command -v $dep &>/dev/null; then
			error "$dep is not installed, please install it first."
		fi
	done
}

main() {
	check_dependencies
}

main "$@"
