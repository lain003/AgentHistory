require 'rails_helper'

RSpec.describe "DeployHistories", :type => :request do
  describe "GET /deploy_histories" do
    it "works! (now write some real specs)" do
      get deploy_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
