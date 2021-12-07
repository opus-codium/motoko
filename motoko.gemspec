# frozen_string_literal: true

require_relative 'lib/motoko/version'

Gem::Specification.new do |spec|
  spec.name          = 'motoko'
  spec.version       = Motoko::VERSION
  spec.authors       = ['Romain Tartière']
  spec.email         = ['romain@blogreen.org']

  spec.summary       = 'Inventory tools for Puppet / Choria infrastructures'
  spec.homepage      = 'https://github.com/opus-codium/motoko'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'choria-mcorpc-support'
  spec.add_dependency 'skittlize', '~> 1.2'
  spec.add_dependency 'terminal-table'

  spec.add_development_dependency 'github_changelog_generator'
  spec.metadata = {
    'rubygems_mfa_required' => 'true',
  }
end
