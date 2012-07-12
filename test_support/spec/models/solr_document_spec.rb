require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SolrDocument do
  describe "#to_model" do

    before do
      class SolrDocumentWithHydraOverride < SolrDocument
         include Hydra::Solr::Document
      end
    end
    # this isn't a great test, but...
    it "should try to cast the SolrDocument to the Fedora object" do
      ActiveFedora::Base.expects(:load_instance_from_solr).with('asdfg', kind_of(SolrDocument))
      SolrDocumentWithHydraOverride.new(:id => 'asdfg').to_model
    end
  end
end
