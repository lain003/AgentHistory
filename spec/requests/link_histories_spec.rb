require 'rails_helper'

RSpec.describe "LinkHistories", :type => :request do
  describe "GET /link_histories" do
    it "works! (now write some real specs)" do
      get link_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
