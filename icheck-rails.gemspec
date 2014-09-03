# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib/', __FILE__)

require 'icheck/rails/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Mihai Târnovan"]
  gem.email         = ["mihai.tarnovan@cubus.ro"]
  gem.description   = %q{Super customized checkboxes and radio buttons with jquery & zepto}
  gem.summary       = %q{iCheck packaged for the Rails asset pipeline}
  gem.homepage      = "https://github.com/cubus/icheck-rails"

  gem.files         = Dir["{vendor,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = Dir["test/**/*"]
  gem.name          = "icheck-rails"
  gem.require_paths = ["lib"]
  gem.version       = ICheck::Rails::VERSION

  gem.add_dependency "rails", ">= 3.1.0"

  gem.add_dependency "jquery-rails"
  gem.add_dependency "sass-rails"

  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'capybara'

end
