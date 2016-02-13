
#The Build Script

# Init
require 'albacore'
#require 'albacore/tasks/versionizer'
load 'rakeConfig.rake'

# setup
toolsDir = if (ENV['toolsDir'] != nil) then ENV['toolsDir'] else toolsDirConfig end


# common tasks
#Albacore::Tasks::Versionizer.new :versioning

task :t do
	puts 't'
	puts "#{toolsDir}"
end

task :default => [:t]