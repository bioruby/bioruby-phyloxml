# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bio-phyloxml/version'

Gem::Specification.new do |spec|
  spec.name          = "bio-phyloxml"
  spec.version       = Bio::PhyloXML::VERSION
  spec.authors       = [ "Diana Jaunzeikare", "Clayton Wheeler",
                         "BioRuby project" ]
  spec.email         = [ "staff@bioruby.org" ]

  spec.summary       = %q{PhyloXML plugin for BioRuby}
  spec.description   = %q{Provides PhyloXML support for BioRuby.}
  spec.homepage      = "http://github.com/bioruby/bioruby-phyloxml"
  spec.license       = "Ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bio", ">= 1.5.0"
  spec.add_runtime_dependency "libxml-ruby", "~> 2.8"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
