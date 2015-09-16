# For removing old BioRuby's Bio::PhyloXML module definition

require 'bio'

module Bio
  if defined? PhyloXML
    if autoload?(:PhyloXML) || !(defined? PhyloXML::VERSION)
      # workaround to remove old BioRuby's PhyloXML
      remove_const :PhyloXML
    end
  end
end #module Bio

