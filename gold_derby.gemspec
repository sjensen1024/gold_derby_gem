require_relative 'lib/gold_derby/version'

Gem::Specification.new do |spec|
  spec.name          = "gold_derby"
  spec.version       = GoldDerby::VERSION
  spec.authors       = ["sjensen1024"]
  spec.email         = ["stevenmjensen1024@gmail.com"]

  spec.summary       = "A gem that reads data from Gold Derby for award show rankings."
  spec.homepage      = "https://github.com/sjensen1024/gold_derby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.3.6")

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/award", "lib/prediction"]

  spec.add_dependency "httparty", "~> 0.22", ">= 0.22.0"
  spec.add_dependency "activesupport", "~> 8.0", ">= 8.0.1"
  spec.add_dependency "nokogiri", "~> 1.18", ">= 1.18.0"
  spec.add_dependency "ostruct", "~> 0.6.1", ">= 0.6.1"
end
