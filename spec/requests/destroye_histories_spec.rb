require 'rails_helper'

RSpec.describe "DestroyeHistories", :type => :request do
  describe "GET /destroye_histories" do
    it "works! (now write some real specs)" do
      get destroye_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
