
require 'rubygems'
require 'rake'
require 'jeweler'
require 'rake/testtask'
require 'rcov/rcovtask'

NAME = "ms-template"

gemspec = Gem::Specification.new do |s|
  s.name = NAME
  s.authors = ["John T. Prince"]
  s.email = "jtprince@gmail.com"
  s.homepage = "http://jtprince.github.com/" + NAME
  s.summary = "An mspire library [TODO: that does what?]"
  s.description = "[TODO: longer description]"
  s.rubyforge_project = 'mspire'
  # s.add_dependency("ms-core", ">= 0.0.2")
  # s.add_development_dependency("ms-testdata", ">= 0.18.0")
  s.add_development_dependency("bacon", ">= 1.1.0")
  s.files << "VERSION"
end

Jeweler::Tasks.new(gemspec)

Rake::TestTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = true
end

Rcov::RcovTask.new do |spec|
  spec.libs << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = true
end


def rdoc_redirect(base_rdoc_output_dir, package_website_page, version)
  content = %Q{
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html><head><title>mspire: #{NAME} rdoc</title>
<meta http-equiv="REFRESH" content="0;url=#{package_website_page}/rdoc/#{version}/">
</head> </html> 
  }
  FileUtils.mkpath(base_rdoc_output_dir)
  File.open("#{base_rdoc_output_dir}/index.html", 'w') {|out| out.print content }
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  base_rdoc_output_dir = 'website/output/rdoc'
  version = File.read('VERSION')
  rdoc.rdoc_dir = base_rdoc_output_dir + "/#{version}"
  rdoc.title = NAME + ' ' + version
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc_redirect(base_rdoc_output_dir, gemspec.homepage,version)
end

task :default => :spec

task :build => :gemspec

# credit: Rakefile modeled after Jeweler's
