require 'rails_helper'

RSpec.describe "destroye_histories/index", :type => :view do
  before(:each) do
    assign(:destroye_histories, [
      DestroyeHistory.create!(
        :ident_code => "Ident Code",
        :agent_id => 1,
        :portal_id => 2,
        :resonator_level => 3
      ),
      DestroyeHistory.create!(
        :ident_code => "Ident Code",
        :agent_id => 1,
        :portal_id => 2,
        :resonator_level => 3
      )
    ])
  end

  it "renders a list of destroye_histories" do
    render
    assert_select "tr>td", :text => "Ident Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
