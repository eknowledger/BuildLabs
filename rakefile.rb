require 'bundler/setup'
require 'albacore'
require 'albacore/tasks/versionizer'
require 'albacore/ext/teamcity'

Albacore::Tasks::Versionizer.new :versioning

desc 'Perform fast build (warn: doesn\'t d/l deps)'
build :quick_build do |b|
  b.logging = 'detailed'
  b.sln     = 'src/SamplAppDesktop.sln'
end

desc 'restore all nugets as per the packages.config files'
nugets_restore :restore do |p|
  p.out = 'src/packages'
  p.exe = 'tools/NuGet.exe'
end

desc 'Perform full build'
build :build => [:versioning, :restore] do |b|
  b.sln = 'src/SamplAppDesktop.sln'
  # alt: b.file = 'src/MyProj.sln'
end


desc 'Run Unit Tests'
test_runner :tests  => [:build] do |tests|
	  tests.files = FileList['**/*.Tests/bin/debug/*.Tests.dll'] 
	  #tests.exe = '../../../../Program Files (x86)/Microsoft Visual Studio 12.0/Common7/IDE/MSTest.exe'
	  tests.exe = 'src/packages/NUnit.Console.3.0.1/tools/nunit3-console.exe'
end


directory 'build/pkg'

desc 'package nugets - finds all projects and package them'
nugets_pack :create_nugets => ['build/pkg', :versioning, :build] do |p|
  p.files   = FileList['src/**/*.{nuspec}'].
    exclude(/Tests/)
  p.out     = 'build/pkg'
  p.exe     = 'tools/NuGet.exe'
  p.with_metadata do |m|
    m.description = 'My cool greeter app'
    m.authors = 'Ahmed'
    m.version = ENV['NUGET_VERSION']
  end

end

task :default => :tests