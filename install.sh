#!/bin/zsh

CURRENT_DIR=$(pwd)

load_env() {
  # Define .env path
  ENV="$CURRENT_DIR/.env"

  # Verify if .env exists
  if [ ! -f "$ENV" ]; then
    echo "ERROR: $ENV not found"
    exit 1
  fi

  # Load .env
  source "$ENV"
}

# The backup and symlink original ideas were grabbed from:
# https://github.com/lewagon/dotfiles/blob/master/install.sh

# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s "$file" "$link"
  fi
}

git_setup() {
  git config --global user.email "$GIT_EMAIL"
}

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
}

install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

apply_macos_settings() {
  "$CURRENT_DIR"/scripts/set-defaults.sh
}

install_brew_bundle() {
  brew bundle --file "$CURRENT_DIR"/Brewfile
}

main () {
  load_env

  install_oh_my_zsh

  # Symlinks
  for name in .aliases .vimrc .zshrc; do
    target="${HOME}/${name}";
    backup "$target"
    symlink "${CURRENT_DIR}/${name}" "$target"
  done

  # Copy files
  for name in .gitconfig; do
    target="${HOME}/${name}";
    backup "$target"
    cp "${CURRENT_DIR}/${name}" "$target"
  done

  git_setup

  apply_macos_settings

  # install_homebrew

  # install_brew_bundle

  echo "That's all folks!"
}

main