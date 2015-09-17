require "bundler/gem_tasks"
require 'rdoc/task'
require 'rake/testtask'

task :default => "test"

Rake::TestTask.new do |t|
  t.test_files = FileList["test/unit/**/test_*.rb"]
end

Rake::RDocTask.new do |r|
  r.rdoc_dir = "rdoc"
  r.rdoc_files.include("README.md",
                       "COPYING", "COPYING.ja", "BSDL", "LGPL", "GPL",
                       "doc/Tutorial.rd",
                       "lib/**/*.rb")
  r.main = "README.md"
  r.options << '--title' << 'Bio::PhyloXML API documentation'
  r.options << '--line-numbers'
end
