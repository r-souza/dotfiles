#!/bin/zsh

brew update && brew upgrade

# brew-cask-upgrade is a command-line tool for upgrading every outdated app installed by Homebrew Cask.
# https://github.com/buo/homebrew-cask-upgrade
brew cu --all --yes

brew cleanup