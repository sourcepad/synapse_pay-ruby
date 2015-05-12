Gem::Specification.new do |s|
  s.name        = 'synapse_pay'
  s.version     = '0.0.0'
  s.date        = '2015-05-11'
  s.summary     = "SynapsePay"
  s.description = "A simple wrapper to connect to the SynapsePay API"
  s.authors     = ["Lester Celestial"]
  s.email       = 'lesterc@sourcepad.com'

  s.add_runtime_dependency 'faraday', '0.9.1'

  s.add_development_dependency "bundler"
  s.add_development_dependency "pry"
  # s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "faker"
  s.add_development_dependency "rspec"

end