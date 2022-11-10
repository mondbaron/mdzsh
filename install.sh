#!/bin/sh

# install prerequisites via apt
sudo apt-get update && sudo apt-get install -yq curl git zsh fonts-powerline

# purge old installations
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh}
rm -f .zsh* .zcompdump* .p10k.zsh

# install oh-my-zsh (unattended)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# add zsh-autosuggestions, zsh-completions and zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# create an inital .zshrc
cat > ~/.zshrc <<EOF
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode reminder
plugins=(git python pip virtualenv zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh
EOF

# lauch the shell to complete setup
zsh
