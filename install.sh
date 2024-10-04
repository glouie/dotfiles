#!/bin/sh

# -e: exit on error
# -u: exit on unset variables
set -eu

if ! chezmoi="$(command -v chezmoi)"; then
	bin_dir="${HOME}/.local/bin"
	chezmoi="${bin_dir}/chezmoi"
	echo "Installing chezmoi to '${chezmoi}'" >&2
	if command -v curl >/dev/null; then
		chezmoi_install_script="$(curl -fsSL get.chezmoi.io)"
	elif command -v wget >/dev/null; then
		chezmoi_install_script="$(wget -qO- get.chezmoi.io)"
	else
		echo "To install chezmoi, you must have curl or wget installed." >&2
		exit 1
	fi
	sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
	unset chezmoi_install_script bin_dir
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

set -- init --apply --source="${script_dir}" 

echo "Running 'chezmoi $*'" >&2
# exec: replace current process with chezmoi
# exec "$chezmoi" "$@"
# exec "$chezmoi" init --apply glouie
"$chezmoi" init --apply glouie

if ! brew="$(command -v brew)"; then
	echo "Brew not found."
	# install homebrew
	echo "Attempting to install homebrew..."
	echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	# install Brewfile
	"$brew" bundle install
fi

if ! zsh="$(command -v zsh)"; then
	echo "zsh not found"
	if apt="$(command -v apt)"; then
		sudo "$apt" install -y zsh
	fi
else
	source "$HOME/.zshrc"
fi

echo "Installing fonts..."
# install fonts (need Nerd Fonts) 
fc-cache -fv
# list fonts
fc-list 


