#!/bin/bash
# securing home
cd &&\
# install git
sudo apt install -y git &&\
# install build essentials
sudo apt install -y build-essential &&\
# install java
sudo apt install -y openjdk-21-jdk &&\
# clone dotfiles
sudo rm -rf ~/dotfiles &&\
git clone git@github.com:silverleyjr/dotfiles.git &&\
# install curl
sudo apt install -y curl &&\ 
# install zsh
sudo apt install -y zsh &&\
# tornando zsh default
grep /usr/bin/zsh /etc/shells || echo "/usr/bin/zsh" | sudo tee -a /etc/shells && \
chsh -s /usr/bin/zsh &&\
# clone base16
sudo rm -rf ~/.config/base16-shell &&\
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell &&\
# download and install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz &&\
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz &&\
sudo rm nvim-linux-x86_64.tar.gz &&\
# kitty
mkdir -p ~/.local/bin &&\
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin &&\
sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/bin/ &&\
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/ &&\
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/ &&\
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop &&\
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop &&\
echo 'kitty.desktop' > ~/.config/xdg-terminals.list &&\
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50 &&\
gsettings set org.gnome.desktop.default-applications.terminal exec $(which kitty) &&\
# install node nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&\
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install v23.9.0 &&\
# install ohmyzsh
sudo rm -rf ~/.oh-my-zsh &&\
wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed '/env zsh/d' | sh &&\
# clone powerlever10k (theme)
sudo rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&\
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
# copying config from dotfiles
cp ~/dotfiles/.zshrc ~/ &&\
cp -r ~/dotfiles/nvim ~/.config &&\
cp ~/dotfiles/.p10k.zsh ~/
