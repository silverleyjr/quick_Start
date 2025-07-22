#!/bin/bash
cd &&\
sudo apt install -y git &&\
sudo rm -rf ~/dotfiles &&\
git clone git@github.com:silverleyjr/dotfiles.git &&\
sudo apt install -y curl &&\ 
sudo apt install -y zsh &&\
sudo rm -rf ~/.config/base16-shell &&\
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell &&\
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz &&\
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz &&\
sudo rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&\
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
cp ~/dotfiles/.zshrc ~/ &&\
cp ~/dotfiles/nvim ~/.config &&\
mkdir ~/.local/bin &&\
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&\
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install v23.9.0 &&\
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
