# frozen_string_literal: true

require_relative 'lib/helium/version'

Gem::Specification.new do |spec|
  spec.name          = 'helium'
  spec.version       = Helium::VERSION
  spec.authors       = ['Abhay Kumar']
  spec.email         = ['abhay@hackshare.com']

  spec.summary       = 'A Helium network wallet implementation'
  spec.homepage      = 'https://github.com/abhay/helium-wallet'
  spec.required_ruby_version = Gem::Requirement.new('~> 2.6.0')

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.add_dependency('base58', '~> 0.2.3')
  spec.add_dependency('http', '~> 4.3')
  spec.add_dependency('protobuf', '~> 3.10')
  spec.add_dependency('rbnacl', '~> 7.1')
  spec.add_development_dependency('down', '~> 5.1')
  spec.add_development_dependency('rake', '~> 13.0')
  spec.add_development_dependency('rspec', '~> 3.9')
  spec.add_development_dependency('webmock', '~> 3.8')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
