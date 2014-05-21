# git clone git@github.com:marksim/.dotfiles.git ~/.dotfiles
# ~/.dotfiles/install.sh

xcode-select --install
 
# homebrew / cask / util
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
brew doctor
brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install alfred
brew cask install iterm2
 
# .dotfiles / shell
curl -L https://raw.githubusercontent.com/marksim/oh_my_zsh/master/tools/install.sh | sh
cd ~/.dotfiles && rake install
 
# vim
brew cask install macvim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
 
# ruby
brew install rbenv ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.zshrc
rbenv install 1.9.3-p448
rbenv global 1.9.3-p448
gem update -—system
gem install bundler
brew install qt
curl get.pow.cx | sh
 
# tmux
brew tap nviennot/tmate
brew install tmux reattach-to-user-namespace tmate
 
# various apps
brew install ical-buddy
brew cask install moom
brew cask install one-password
brew cask install google-chrome
brew cask install spotify
brew cask install hipchat
brew cask install acorn
brew cask install things
brew cask install tower
 
# Dropbox must be installed
sudo rm -rf ~/Documents && ln -s ~/Dropbox/Documents ~/Documents
 
# more dev
brew install mongodb
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
brew install redis
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
brew install imagemagick
brew install pidof
