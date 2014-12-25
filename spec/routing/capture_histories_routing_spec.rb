require "rails_helper"

RSpec.describe CaptureHistoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/capture_histories").to route_to("capture_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/capture_histories/new").to route_to("capture_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/capture_histories/1").to route_to("capture_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/capture_histories/1/edit").to route_to("capture_histories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/capture_histories").to route_to("capture_histories#create")
    end

    it "routes to #update" do
      expect(:put => "/capture_histories/1").to route_to("capture_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/capture_histories/1").to route_to("capture_histories#destroy", :id => "1")
    end

  end
end
