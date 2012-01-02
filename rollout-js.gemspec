Gem::Specification.new do |s|
  s.name = "rollout-js"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nikita Fedyashev"]
  s.date = "2012-01-01"
  s.description = "Conditionally rollout new features with Javascipt"
  s.email = "loci.master@gmail.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "Rakefile",
    "README.md",
    "VERSION",
    "app/assets/javascripts/js-rollout.js.erb",
    "rollout-js.gemspec",
    "lib/assets/rollout.js",
    "lib/rollout_js/configuration.rb",
    "lib/rollout_js/redis_middleware.rb",
    "lib/rollout_js.rb",
    "spec/rollout_js_configuration_spec.rb",
    "spec/rollout_js_spec.rb",
    "spec/spec_helper.rb"
  ]

  s.homepage = "http://github.com/nfedyashev/rollout-js"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = ""

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_runtime_dependency(%q<rollout>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<bourne>, ["= 1.0.0"])
      s.add_runtime_dependency(%q<redis>, ["= 0.1"])
      s.add_development_dependency(%q<therubyracer>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<therubyracer>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_dependency(%q<rollout>, ["~> 1.0.0"])
      s.add_dependency(%q<bourne>, ["= 1.0.0"])
      s.add_dependency(%q<redis>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<therubyracer>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.7.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<rollout>, ["~> 1.0.0"])
    s.add_dependency(%q<bourne>, ["= 1.0.0"])
    s.add_dependency(%q<redis>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

