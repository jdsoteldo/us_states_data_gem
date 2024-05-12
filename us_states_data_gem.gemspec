# states_gem.gemspec

Gem::Specification.new do |spec|
  spec.name = "us_states_data_gem"
  spec.version       = "1.0.0"
  spec.authors       = ["JD Soteldo"]
  spec.email         = ["jdsoteldo00@gmail.com"]
  spec.summary       = "A Ruby gem to provide information about US states, counties, and zip codes."
  spec.description   = "This gem provides methods to retrieve information about US states, including counties and zip codes. It also includes functionality to validate zip codes."
  spec.homepage      = "https://github.com/jdsoteldo/us_states_gem"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "lib/us_states_data.rb"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.require_paths = ["lib"]
end
