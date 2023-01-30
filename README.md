# My dotfiles

## About this repository

This repository contains my dotfiles and some scripts to automate the installation of the main packages and applications I use on macOS.

To automate the installation of packages, I use [Homebrew](https://brew.sh/), [Homebrew Cask](https://caskroom.github.io/) and [mas-cli](https://github.com/mas-cli/mas). The [Brewfile](Brewfile) contains the list of packages and applications.

If you want to understand more about how to use Homebrew Bundle, I recommend you to read [this great gist](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f) from [Christopher Allen](https://gist.github.com/ChristopherA) 

In addition to the packages and applications, this repository also applies some macOS defaults [settings](scripts/set-defaults.sh). Some of these settings are based on this [repository](https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh). More useful settings can be found on [macosdefaults.com](https://macosdefaults.com/).

## Usage

Clone this repository to a directory called `.dotfiles` in your home directory:

```shell
git clone https://github.com/r-souza/dotfiles.git ~/.dotfiles
```

Open the `.dotfiles` directory and run the `install.sh` script.

```shell
cd ~/.dotfiles
./install.sh
```

That's it! 🎉

Basically, this script will:

1. Install Oh My Zsh;
2. Symlink/Copy the dotfiles to the home directory;
3. Apply macOS defaults settings;
4. Apply iTerm2 settings;
5. Install Homebrew 
6. Apply Homebrew Bundle;

I recommend you to inspect the [install.sh](install.sh) script before running it.

## License

This repository is licensed under the MIT license. See the [LICENSE](LICENSE) file for rights and limitations (MIT).