require 'rake'
require 'find'
require 'pathname'

IGNORE_FILES = [/^\.gitignore$/, /^Rakefile$/,/^README.textile$/]

files = `git ls-files`.split("\n")
files.reject! { |f| IGNORE_FILES.any? { |re| f.match(re) } }

desc 'zip project for uploading'
task :zip do
    system("zip codepath.zip #{files.join(" ")}")
end

desc 'pulls from git repository'
task :pull do
    puts "Updating from git repository"
    system("cd " << Dir.new(File.dirname(__FILE__)).path << " && git pull")
end

task :default => ['zip']
