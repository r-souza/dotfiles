#!/bin/zsh
#
# The original idea (and a couple settings) were grabbed from:
# https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh
#
# More settings can be seen here:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Dock: Enable icons magnification
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock largesize -int 96

# Dock: Enable autohide 
defaults write com.apple.dock autohide -int 1

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Change Screenshots directory path 
mkdir -p "${HOME}/Pictures/Screenshots" >/dev/null 2>&1
defaults write com.apple.screencapture location "${HOME}/Pictures/Screenshots"

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the top-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 3
defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Set up iTerm2
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/.dotfiles/settings/iterm2"