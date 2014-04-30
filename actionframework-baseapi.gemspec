Gem::Specification.new do |s|
  s.name        = 'actionframework-baseapi'
  s.version     = '0.2.0'
  s.licenses    = ['MIT']
  s.summary     = "ActionFramework BaseAPI"
  s.description = "ActionFramework class to create simple API's (kind of like Grape)"
  s.authors     = ["Bram Vandenbogaerde"]
  s.email       = ''
  s.files       = ["lib/actionframework/baseapi.rb"]
  s.homepage    = 'https://rubygems.org/gems/example'
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "rack"
end
