#!/usr/bin/env ruby

require 'optparse'

def run(cmd)
  reply = `#{cmd}`
  if reply || reply != ""
    puts reply
  end
end

def replace(file, old, new)
  run %Q{ruby -pi -e 'gsub("#{old}", "#{new}")' #{file}}
end

opt = {
  :author => "[TODO: AUTHOR]",
  :email => "[TODO: email]",
}
$force = false

opts = OptionParser.new do |op|
  op.banner = "usage: #{File.basename(__FILE__)} <project_name> <github_username>"
  op.separator "creates a new mspire package from the top ms-template dir"
  op.separator "Designed to work with a project name like: ms-template "
  op.separator "giving 'ms/template' and Ms::Template"
  op.separator "assumes use of Jeweler"
  op.separator "OPTIONS (will fill in with [TODO: xxx] if missing"
  op.on("-a", "--author <string>", "the author of the package ('First Last')") {|v| opt[:author] = v }
  op.on("-e", "--email <string>", "email address of author") {|v| opt[:email] = v }
  op.on("-f", "--force", "write over files if necessary") {|v| $force = v }
  op.on("-t", "--template", "build the github template") {|v| opt[:template] = v }
end
opts.parse!

if ARGV.size != 2
  puts opts
  exit
end

if File.basename(Dir.pwd) != 'ms-template'
  abort "you need to be inside ms-template to run this (run: bin/#{File.basename(__FILE__)})"
end

(project, github_username) = ARGV
orig_project = "ms-template"

replace "README.rdoc", orig_project, project
