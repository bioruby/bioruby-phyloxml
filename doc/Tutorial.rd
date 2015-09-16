# This document is generated with a version of rd2html (part of Hiki)
#
# A possible test run could be from rdtool (on Debian package rdtool)
#
#   rd2 $BIORUBYPATH/doc/Tutorial.rd
#
# or with style sheet:
#
#   rd2 -r rd/rd2html-lib.rb --with-css=bioruby.css $BIORUBYPATH/doc/Tutorial.rd > ~/bioruby.html
#
# in Debian:
#
#   rd2 -r rd/rd2html-lib  --with-css="../lib/bio/shell/rails/vendor/plugins/bioruby/generators/bioruby/templates/bioruby.css" Tutorial.rd > Tutorial.rd.html
#
# A common problem is tabs in the text file! TABs are not allowed.
#
# To add tests run Toshiaki's bioruby shell and paste in the query plus
# results.
#
# To run the embedded Ruby doctests you can use the rubydoctest tool, part
# of the bioruby-support repository at http://github.com/pjotrp/bioruby-support/
#

=begin
#doctest Testing bioruby

= BioRuby Tutorial

* Copyright (C) 2001-2003 KATAYAMA Toshiaki <k .at. bioruby.org>
* Copyright (C) 2005-2009 Pjotr Prins, Naohisa Goto and others

= PhyloXML

PhyloXML is an XML language for saving, analyzing and exchanging data of 
annotated phylogenetic trees. PhyloXML parser in BioRuby is implemented in 
Bio::PhyloXML::Parser and writer in Bio::PhyloXML::Writer. 
More information at www.phyloxml.org

== Requirements

In addition to BioRuby library you need a libxml ruby bindings. To install:

  % gem install -r libxml-ruby

For more information see ((<URL:http://libxml.rubyforge.org/install.xml>))

== Parsing a file

    require 'bio'
    
    # Create new phyloxml parser
    phyloxml = Bio::PhyloXML::Parser.new('example.xml')
    
    # Print the names of all trees in the file
    phyloxml.each do |tree|
      puts tree.name
    end

If there are several trees in the file, you can access the one you wish by an index

    tree = phyloxml[3]

You can use all Bio::Tree methods on the tree, since PhyloXML::Tree inherits from Bio::Tree. For example,

   tree.leaves.each do |node|
     puts node.name
   end

PhyloXML files can hold additional information besides phylogenies at the end of the file. This info can be accessed through the 'other' array of the parser object.

    phyloxml = Bio::PhyloXML::Parser.new('example.xml')
    while tree = phyloxml.next_tree
      # do stuff with trees
    end 
      
    puts phyloxml.other

== Writing a file

    # Create new phyloxml writer
    writer = Bio::PhyloXML::Writer.new('tree.xml')
   
    # Write tree to the file tree.xml
    writer.write(tree1) 
    
    # Add another tree to the file
    writer.write(tree2)

== Retrieving data

Here is an example of how to retrieve the scientific name of the clades.

    require 'bio'
    
    phyloxml = Bio::PhyloXML::Parser.new('ncbi_taxonomy_mollusca.xml')
    phyloxml.each do |tree|
      tree.each_node do |node|
        print "Scientific name: ", node.taxonomies[0].scientific_name, "\n"
      end
    end

== Retrieving 'other' data

    require 'bio'
    
    phyloxml = Bio::PhyloXML::Parser.new('phyloxml_examples.xml')
    while tree = phyloxml.next_tree
     #do something with the trees
    end

    p phyloxml.other
    puts "\n"
    #=> output is an object representation
    
    #Print in a readable way
    puts phyloxml.other[0].to_xml, "\n"
    #=>:
    #
    #<align:alignment xmlns:align="http://example.org/align">
    #  <seq name="A">acgtcgcggcccgtggaagtcctctcct</seq>
    #  <seq name="B">aggtcgcggcctgtggaagtcctctcct</seq>
    #  <seq name="C">taaatcgc--cccgtgg-agtccc-cct</seq>
    #</align:alignment>
    
    #Once we know whats there, lets output just sequences
    phyloxml.other[0].children.each do |node|
     puts node.value
    end
    #=>
    #
    #acgtcgcggcccgtggaagtcctctcct
    #aggtcgcggcctgtggaagtcctctcct
    #taaatcgc--cccgtgg-agtccc-cct


= APPENDIX

== Installing required external library

At this point for using BioRuby no additional libraries are needed, except if
you are using Bio::PhyloXML module. Then you have to install libxml-ruby.

This may change, so keep an eye on the Bioruby website. Also when
a package is missing BioRuby should show an informative message.

At this point installing third party Ruby packages can be a bit
painful, as the gem standard for packages evolved late and some still
force you to copy things by hand. Therefore read the README's
carefully that come with each package.

=== Installing libxml-ruby

The simplest way is to use gem packaging system.

  gem install -r libxml-ruby

If you get `require': no such file to load - mkmf (LoadError) error then do

  sudo apt-get install ruby-dev

If you have other problems with installation, then see ((<URL:http://libxml.rubyforge.org/install.xml>))  

=end
