require 'rails_helper'

RSpec.describe "capture_histories/index", :type => :view do
  before(:each) do
    assign(:capture_histories, [
      CaptureHistory.create!(
        :ident_code => "Ident Code",
        :agent_id => 1,
        :portal_id => 2
      ),
      CaptureHistory.create!(
        :ident_code => "Ident Code",
        :agent_id => 1,
        :portal_id => 2
      )
    ])
  end

  it "renders a list of capture_histories" do
    render
    assert_select "tr>td", :text => "Ident Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
