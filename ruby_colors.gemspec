$:.push File.expand_path('../lib', __FILE__)
require 'ruby_colors/version'

Gem::Specification.new do |s|
  s.name                  = 'ruby_colors'
  s.version               = RubyColors::VERSION.dup
  s.platform              = Gem::Platform::RUBY
  s.authors               = 'EdCordata'
  s.description           = "A simple Ruby library for conversion between color 'names', 'HEX', and 'RGB'"
  s.summary               = "A simple Ruby library for conversion between color 'names', 'HEX', and 'RGB'"
  s.licenses              = ['CC BY 4.0']
  s.files                 = Dir['lib/**/*.*'] + %w[ruby_colors.gemspec readme.md Gemfile Gemfile.lock]
  s.homepage              = 'https://github.com/EdCordata-Ruby-Gems/ruby_colors'
  s.metadata              = {
    'documentation_uri' => 'https://github.com/EdCordata-Ruby-Gems/ruby_colors/blob/master/readme.md',
    'source_code_uri'   => 'https://github.com/EdCordata-Ruby-Gems/ruby_colors',
    'bug_tracker_uri'   => 'https://github.com/EdCordata-Ruby-Gems/ruby_colors/issues',
    'wiki_uri'          => 'https://github.com/EdCordata-Ruby-Gems/ruby_colors/blob/master/readme.md',
  }
  s.require_paths         = ['lib']
  s.required_ruby_version = '>= 1.9.3'
  s.add_dependency('json', '>= 0.4.0')
end
