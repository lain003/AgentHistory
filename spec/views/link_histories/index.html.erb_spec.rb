require 'rails_helper'

RSpec.describe "link_histories/index", :type => :view do
  before(:each) do
    assign(:link_histories, [
      LinkHistory.create!(
        :ident_code => "Ident Code",
        :agent_id => 1,
        :to_portal_id => 2,
        :from_portal_id => 3
      ),
      LinkHistory.create!(
        :ident_code => "Ident Code",
        :agent_id => 1,
        :to_portal_id => 2,
        :from_portal_id => 3
      )
    ])
  end

  it "renders a list of link_histories" do
    render
    assert_select "tr>td", :text => "Ident Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
