require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('phplist', '0.1.1') do |p|
  p.description    = "Phplist subscriber"
  p.url            = "http://github.com/ahmadhussain/phplist"
  p.author         = "Ahmad Hussain"
  p.email          = "ahmadhmugl@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
