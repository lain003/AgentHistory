require "rails_helper"

RSpec.describe LinkHistoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/link_histories").to route_to("link_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/link_histories/new").to route_to("link_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/link_histories/1").to route_to("link_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/link_histories/1/edit").to route_to("link_histories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/link_histories").to route_to("link_histories#create")
    end

    it "routes to #update" do
      expect(:put => "/link_histories/1").to route_to("link_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/link_histories/1").to route_to("link_histories#destroy", :id => "1")
    end

  end
end
