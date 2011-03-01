Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = 'em-swirl'
  s.version = '0.1.1'
  s.date = '2011-02-28'

  s.description = "An evented, version agnostic EC2 ruby driver"
  s.summary     = s.description

  s.authors = ["Blake Mizerany"]

  # = MANIFEST =
  s.files = %w[LICENSE README.md] +
    Dir["{lib,test}/**/*.rb"] +

  s.executables = []

  # = MANIFEST =

  s.extra_rdoc_files = %w[README.md LICENSE]
  s.add_dependency 'swirl', '>= 0.7.0'
  s.add_dependency 'em-http-request', '>= 0.3.0'

  s.has_rdoc = true
  s.homepage = "http://github.com/bmizerany/em-swirl"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "em-swirl", "--main", "README.rdoc"]
  s.require_paths = %w[lib]
  s.rubyforge_project = 'em-swirl'
  s.rubygems_version = '1.1.1'
end
