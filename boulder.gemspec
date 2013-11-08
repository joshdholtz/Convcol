Gem::Specification.new do |s|
	s.name        = 'boulder'
	s.version     = '0.0.1'
	s.executables << 'boulder'
	s.date        = '2013-11-02'
	s.summary     = "Boulder"
	s.description = "Android library dependency manager"
	s.authors     = ["Josh Holtz"]
	s.email       = 'me@joshholtz'
	s.files       = Dir["lib/**/*.rb"]
	s.homepage    = 'http://rubygems.org/gems/boulder'

	s.add_runtime_dependency "git", ["= 1.2.6"]
end