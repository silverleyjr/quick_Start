git clone git@github.com:silverleyjr/dotfiles.git
sudo apt install zsh
cp ./dotfiles/.zshrc ./
sudo snap install nvim --classic.
cp ./dotfiles/nvim ./.config
cd .local
mkdir bin
cd
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install v23.9.0
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

