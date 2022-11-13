#!/bin/sh

# install prerequisites via apt if required
if ! dpkg -s curl git zsh > /dev/null; then
    sudo apt-get update && sudo apt-get install -yq curl git zsh
fi

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
plugins=(extract rsync git python pip virtualenv)

# Additional Plugins
plugins=(zsh-completions $plugins)
plugins=(zsh-autocomplete $plugins)
plugins=(zsh-syntax-highlighting $plugins)
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
plugins=(zsh-autosuggestions $plugins)

# Optional Plugins (uncomment to activate)
#plugins=(autoswitch_virtualenv $plugins)

# Proceed with oh-my-zsh
source \$ZSH/oh-my-zsh.sh
EOF

# lauch the shell to complete setup
zsh
