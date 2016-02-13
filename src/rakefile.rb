require 'albacore'

load 'rakeconfig.rb'

$svn_revision = "WRONG"
desc "Default: Update Version, Clean and Build in Debug mode"
task :default => [:config, :assemblyinfo, :build]

desc "Shows config options"
task :config do
	puts "SVN_LOG_PATH = #{SVN_LOG_PATH}"
    puts "VERSION_MAJOR_MINOR_BUILD = #{VERSION_MAJOR_MINOR_BUILD}"
    puts "PUBLISH_DIR = #{PUBLISH_DIR}"
    puts "SOLUTION = #{SOLUTION}"
    puts "PROJECT_NAME = #{PROJECT_NAME}"
    puts "ASMINFO_PATH = #{ASMINFO_PATH}"
    puts "REPO_URL = #{REPO_URL}"
end

desc 'Update assembly info'
task :assemblyinfo do |asm|
	asm.input_file = "#{ASMINFO_PATH}/AssemblyInfo.cs"
	asm.version = "1.0.0" #need to update the version
	asm.company_name = "GoFormz"
	asm.product_name = "Desktop Greeter"
	asm.copyright = "(c) 2013 by GoFormz"
	asm.output_file = "#{ASMINFO_PATH}/AssemblyInfo.cs"
end

desc 'building'
task :build do |msb|
	msb.properties = { :configuration => :Debug}
	msb.targets = [:Clean, :Build]
	msb.solution = SOLUTION
end

desc 'Code Coverage'
task :cover do
	sh "C:\\Projects\\__Git\\Labs\\BuildLabs\\src\\packages\\OpenCover.4.6.166\\tools\\OpenCover.Console.exe -register:user -target:\"C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\IDE\\mstest.exe\" -targetargs:\"/noisolation /testcontainer:\"C:\\Projects\\__Git\\Labs\\BuildLabs\\src\\SampleApp.Core.Tests\\bin\\Debug\\SampleApp.Core.Tests.dll\" /resultsfile:C:\\Projects\\reports\\.trx \" -output:C:\\Projects\\reports\\testcoverage.xml"
end

task :report =>[:cover] do
	sh "C:\\Projects\\__Git\\Labs\\BuildLabs\\src\\packages\\ReportGenerator.2.3.5.0\\tools\\ReportGenerator.exe -reports:\"C:\\Projects\\reports\\testcoverage.xml\"  -targetdir:\"C:\\Projects\\reports\\CodeCoverage\""
end















