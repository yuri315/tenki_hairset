# -*- encoding: utf-8 -*-
# stub: rubocop-rails 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-rails".freeze
  s.version = "2.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rubocop-hq/rubocop-rails/issues", "changelog_uri" => "https://github.com/rubocop-hq/rubocop-rails/blob/master/CHANGELOG.md", "documentation_uri" => "https://docs.rubocop.org/rubocop-rails/", "homepage_uri" => "https://docs.rubocop.org/rubocop-rails/", "source_code_uri" => "https://github.com/rubocop-hq/rubocop-rails/" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bozhidar Batsov".freeze, "Jonas Arvidsson".freeze, "Yuji Nakayama".freeze]
  s.date = "2020-06-08"
  s.description = "Automatic Rails code style checking tool.\nA RuboCop extension focused on enforcing Rails best practices and coding conventions.\n".freeze
  s.email = "rubocop@googlegroups.com".freeze
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "https://github.com/rubocop-hq/rubocop-rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.4.8".freeze
  s.summary = "Automatic Rails code style checking tool.".freeze

  s.installed_by_version = "3.4.8" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<activesupport>.freeze, [">= 4.2.0"])
  s.add_runtime_dependency(%q<rack>.freeze, [">= 1.1"])
  s.add_runtime_dependency(%q<rubocop>.freeze, [">= 0.82.0"])
end
