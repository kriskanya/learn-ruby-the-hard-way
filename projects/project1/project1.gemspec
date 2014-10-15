# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "project1"
  spec.version       = '1.0'
  spec.authors       = ["Kristian"]
  spec.email         = ["kriskanya@gmail.com"]
  spec.summary       = %q{Short summary of your project}
  spec.description   = %q{Longer description of your project.}
  spec.homepage      = "http://domainforproject.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/project1.rb']
  spec.executables   = ['bin/project1']
  spec.test_files    = ['tests/test_project1.rb']
  spec.require_paths = ["lib"]
end
