desc "Install all scripts"
task :install do
  files = Dir.entries(Dir.pwd).select {|f| File.file?(f) && f[0] == '.'}
  current = Dir.pwd
  files.each do |f|
    command = "ln -s ~/#{f} #{current}/#{f}"
    `#{command}`
  end
end
