#!/bin/sh

# install prerequisites via apt
sudo apt-get update && sudo apt-get install -yq curl git zsh fonts-powerline

# purge old installations
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh}
rm -f .zsh* .zcompdump* .p10k.zsh

# install oh-my-zsh (unattended)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# add some custom plugins
git clone --depth 1 https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoswitch_virtualenv
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# create an inital .zshrc
cat >~/.zshrc <<EOF
# Use default ZSH folder
export ZSH="\$HOME/.oh-my-zsh"

# Set theme to powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# enable oh-my-zsh update reminder
zstyle ':omz:update' mode reminder

# Default Plugins
plugins=(extract rsync git python pip virtualenv zsh-autocomplete zsh-completions zsh-syntax-highlighting)

# Optional Plugins (uncomment to activate)
#plugins(autoswitch_virtualenv \$plugins)
#plugins(zsh-autosuggestions \$plugins)

# Proceed with oh-my-zsh
source \$ZSH/oh-my-zsh.sh
EOF

# lauch the shell to complete setup
zsh
