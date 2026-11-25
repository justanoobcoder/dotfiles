#!/usr/bin/env bash
# Symlink the dotfiles into $HOME with relative links (~/.config/foo -> ../.dotfiles/.config/foo).
# Run it after the first nixos-rebuild, so home-manager has created ~/.config/fish first.
# Safe to re-run: correct links are left alone, and existing files are never replaced.
set -euo pipefail

cd "$(dirname "$(realpath "$0")")"

# ~/.config/fish belongs to home-manager (config.fish, functions/), so only conf.d is linked.
paths=(.config/* .config/fish/conf.d .local/bin)

for p in "${paths[@]}"; do
	[ "$p" = .config/fish ] && continue
	target="$HOME/$p"
	mkdir -p "$(dirname "$target")"
	link=$(realpath --relative-to="$(dirname "$target")" "$p")

	if [ -L "$target" ] && [ "$(readlink "$target")" = "$link" ]; then
		continue
	elif [ -e "$target" ] || [ -L "$target" ]; then
		echo "skip $target: already exists" >&2
		continue
	fi

	ln -s "$link" "$target"
	echo "link $target -> $link"
done
