SVN_LOG_PATH = if (ENV['SVN_LOG_PATH'] == nil) then "log.xml" else ENV['SVN_LOG_PATH'] end
VERSION_MAJOR_MINOR_BUILD = if (ENV['VERSION_MAJOR_MINOR_BUILD'] == nil) then "1.0.0" else ENV['VERSION_MAJOR_MINOR_BUILD'] end
PUBLISH_DIR = if (ENV['PUBLISH_DIR'] == nil) then "C:\\projects\\Deploy\\MySolution" else ENV['PUBLISH_DIR'] end
SOLUTION = if (ENV['SOLUTION'] == nil) then "SamplAppDesktop.sln" else ENV['SOLUTION'] end
PROJECT_NAME = if (ENV['PROJECT_NAME'] == nil) then "SampleApp.Core.csproj" else ENV['PROJECT_NAME'] end
ASMINFO_PATH = if (ENV['ASMINFO_PATH'] == nil) then "SampleApp.Core.csproj\\Properties" else ENV['ASMINFO_PATH'] end
REPO_URL = if (ENV['REPO_URL'] == nil) then "https://svn.repo.url/path" else ENV['REPO_URL'] end
