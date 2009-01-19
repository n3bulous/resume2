# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{resume2}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kevin McFadden"]
  s.date = %q{2009-01-18}
  s.default_executable = %q{resume2}
  s.email = %q{kevin+github@conceptsahead.com}
  s.executables = ["resume2"]
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown", "Rakefile", "lib/resume2", "lib/resume2/generator.rb", "lib/resume2/resume2_application.rb", "lib/resume2/version.rb", "lib/resume2.rb", "test/test_helper.rb", "test/unit", "test/unit/resume2_test.rb", "bin/resume2"]
  s.has_rdoc = true
  s.homepage = %q{http://conceptsahead.com}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Manage your resume information in a central YAML file and then export it into different formats and themes.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rdiscount>, ["~> 1.2.0"])
    else
      s.add_dependency(%q<rdiscount>, ["~> 1.2.0"])
    end
  else
    s.add_dependency(%q<rdiscount>, ["~> 1.2.0"])
  end
end
