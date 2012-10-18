Gem::Specification.new do |s|
  s.name        = 'active-resource-pagination'
  s.version     = '0.0.2'
  s.date        = '2012-10-17'
  s.summary     = "ActiveResource pagination"
  s.description = "Basic pagination support for ActiveResource"
  s.authors     = ["Jeff Moss"]
  s.email       = 'jmoss@heavyobjects.com'
  s.homepage    = 'https://github.com/jeffmoss/active-resource-pagination'

  s.files       = ["lib/active_resource/pagination.rb"]
  s.test_files  = ['test/pagination_test.rb']

  s.add_dependency('activeresource', '>= 0')

  s.add_development_dependency('rake', '>= 0')
end
