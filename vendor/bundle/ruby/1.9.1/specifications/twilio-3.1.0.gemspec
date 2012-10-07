# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "twilio"
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Phil Misiowiec", "Jonathan Rudenberg", "Alex K Wolfe", "Kyle Daigle", "Jeff Wigal", "Yuri Gadow", "Vlad Moskovets"]
  s.date = "2011-11-18"
  s.description = "Twilio API wrapper"
  s.email = ["github@webficient.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "twilio"
  s.rubygems_version = "1.8.24"
  s.summary = "Twilio API Client"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<httparty>, ["~> 0.8"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.6.2"])
    else
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<httparty>, ["~> 0.8"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<webmock>, ["~> 1.6.2"])
    end
  else
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<httparty>, ["~> 0.8"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<webmock>, ["~> 1.6.2"])
  end
end
