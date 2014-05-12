desc "Install all scripts"
task :install do
  files = Dir.entries(Dir.pwd).select {|f| File.file?(f) && f[0..0] == '.'}
  current = Dir.pwd
  ([files] + [".vim"]).flatten.each do |f|
    command = "ln -s #{current}/#{f} ~/#{f}"
    puts command
    `#{command}`
  end
end

task :brew do
  `ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`
  `brew doctor`
  `brew tap phinze/homebrew-cask`
  `brew install brew-cask`
end

task :vim => :brew do
  `brew cask install macvim`
  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  `vim +PluginInstall +qall`
end

task :apps => :brew do
  `brew cask install alfred`
  `brew cask install iterm2`
  `brew cask install google-chrome`
  `brew cask install spotify`
  `brew cask install hipchat`
  `brew cask install acorn`
  `brew cask install things`
  `brew cask install tower`
  `brew install tmux reattach-to-user-namespace`
  `brew install ical-buddy`
end

task :rbenv => :brew do
  `brew install rbenv ruby-build rbenv-gem-rehash`
end

task :ruby => :rbenv do
  `echo 'eval "$(rbenv init - --no-rehash)"' >> ~/.zshrc`
  `rbenv install 1.9.3-p448`
  `rbenv global 1.9.3-p448`
  `gem update -—system`
  `gem install bundler`
end
