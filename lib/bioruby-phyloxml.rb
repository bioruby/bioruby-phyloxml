#

if RUBY_VERSION >=  "1.9" then
  require_relative "bio-phyloxml.rb"
else
  dir = File.dirname(__FILE__)
  target = File.join(dir, "bio-phyloxml.rb")
  require target
end

