# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "phplist"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ahmad Hussain"]
  s.date = "2013-11-27"
  s.description = "Phplist subscriber"
  s.email = "ahmadhmugl@gmail.com"
  s.extra_rdoc_files = ["CHANGELOG", "README.md", "README.rdoc", "lib/phplist.rb"]
  s.files = ["CHANGELOG", "README.md", "README.rdoc", "Rakefile", "lib/phplist.rb", "phplist.gemspec", "Manifest"]
  s.homepage = "http://github.com/ahmadhussain/phplist"
  s.rdoc_options = ["--line-numbers", "--title", "Phplist", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "phplist"
  s.rubygems_version = "1.8.25"
  s.summary = "Phplist subscriber"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
