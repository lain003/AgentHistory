require "rails_helper"

RSpec.describe DestroyeHistoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/destroye_histories").to route_to("destroye_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/destroye_histories/new").to route_to("destroye_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/destroye_histories/1").to route_to("destroye_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/destroye_histories/1/edit").to route_to("destroye_histories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/destroye_histories").to route_to("destroye_histories#create")
    end

    it "routes to #update" do
      expect(:put => "/destroye_histories/1").to route_to("destroye_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/destroye_histories/1").to route_to("destroye_histories#destroy", :id => "1")
    end

  end
end
