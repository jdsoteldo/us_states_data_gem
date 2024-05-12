# states_gem.gemspec

Gem::Specification.new do |spec|
  spec.name = "us_states_data_gem"
  spec.version       = "1.0.0"
  spec.authors       = ["JD Soteldo"]
  spec.email         = ["jdsoteldo00@gmail.com"]
  spec.summary       = "A Ruby gem to provide information about US states, counties, and zip codes."
  spec.description   = "UsStatesData is a versatile Ruby gem designed to simplify working with US state data. Whether you're building a geographic application, conducting data analysis, or enhancing your project with location-based features, UsStatesData provides a comprehensive set of methods to streamline your workflow. With UsStatesData, you can effortlessly retrieve detailed information about US states, including lists of counties and zip codes. Need to validate zip codes? UsStatesData has you covered with built-in functionality for zip code validation, ensuring data accuracy and reliability. Whether you're a developer looking to integrate US state data into your application or a data enthusiast exploring geographic trends, UsStatesData empowers you with the tools you need to unlock insights and build impactful solutions."  
  spec.homepage      = "https://github.com/jdsoteldo/us_states_gem"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb", "lib/us_states_data.rb", "lib/us_states_data.yml"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.require_paths = ["lib"]
end
