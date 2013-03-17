require "spec_helper"
require "kippt/list"

describe Kippt::List do
  subject { Kippt::List.new(data, collection_resource) }
  let(:collection_resource) { Kippt::Client.new(valid_user_credentials).lists }

  let(:data) { MultiJson.load(fixture("list.json").read) }
  let(:attributes) { 
    [:id, :rss_url, :updated, :title,
     :created, :slug, :resource_uri]
  }

  it_behaves_like "resource"

  describe "#private?" do
    it "gets data from is_private" do
      list = Kippt::List.new({:is_private => true}, nil)
      list.private?.should be_true
    end
  end
end
