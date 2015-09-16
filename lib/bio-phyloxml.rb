# Please require your code below, respecting the naming conventions in the
# bioruby directory tree.
#
# For example, say you have a plugin named bio-plugin, the only uncommented
# line in this file would be
#
#   require 'bio/bio-plugin/plugin'
#
# In this file only require other files. Avoid other source code.

require 'bio-phyloxml/compat/cleanup.rb'
require 'bio-phyloxml/version.rb'
require 'bio-phyloxml/phyloxml_elements.rb'
require 'bio-phyloxml/phyloxml_parser.rb'
require 'bio-phyloxml/phyloxml_writer.rb'

if require 'bio-phyloxml/compat/stub_phyloxml_elements.rb'
  require_relative 'bio/db/phyloxml/phyloxml_elements.rb'
end

if require 'bio-phyloxml/compat/stub_phyloxml_parser.rb'
  require_relative 'bio/db/phyloxml/phyloxml_parser.rb'
end

if require 'bio-phyloxml/compat/stub_phyloxml_writer.rb'
  require_relative 'bio/db/phyloxml/phyloxml_writer.rb'
end
