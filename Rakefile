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
