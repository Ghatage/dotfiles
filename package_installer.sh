#!/bin/sh
exec >> err_file

# Logging functions
log_end (){
	>&2 echo "Installed "$1
	echo "\nInstalled "$1
	echo "\n======================\n"
}

log_msg () {
	>&2 echo $1
}

# Installer function
install_package() {
	apt-get install $1 -y
	log_end $1
}


# Main entry point

log_msg "Updating repo list"
#apt-get update  

log_msg "Initiating install of basics"
install_package g++
install_package git

log_msg "Installing vim and other IDE tools"
install_package vim
install_package exuberant-ctags
install_package cscope

log_msg "Setting up IDE env"
git clone https://github.com/Ghatage/dotfiles.git
cp ./dotfiles/.bashrc ~
chmod 644 ~/.bashrc
log_msg ".bashrc installed"

cp ./dotfiles/.vimrc ~
chmod 644 ~/.vimrc
log_msg ".vimrc installed"
cp -r ./dotfiles/.vim ~
chmod -R 644 ~/.vim
log_msg "vim plugins installed"

install_package rbenv
apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs -y



# Manual installation
log_msg "\nInstall this part manually for the blog\n\n"
log_msg " git clone git://github.com/sstephenson/rbenv.git .rbenv\n
echo 'export PATH=\"\$HOME/.rbenv/bin:\$PATH\"' >> ~/.bash_profile\n
echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile\n\n

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build\n
echo 'export PATH=\"\$HOME/.rbenv/plugins/ruby-build/bin:\$PATH\"' >> ~/.bash_profile\n
source ~/.bash_profile\n\n

rbenv install -v 2.3.0\n
rbenv global 2.3.0\n\n

gem install bundler\n
gem install jekyll\n
"


