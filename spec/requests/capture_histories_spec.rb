require 'rails_helper'

RSpec.describe "CaptureHistories", :type => :request do
  describe "GET /capture_histories" do
    it "works! (now write some real specs)" do
      get capture_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
