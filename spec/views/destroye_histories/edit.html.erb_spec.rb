require 'rails_helper'

RSpec.describe "destroye_histories/edit", :type => :view do
  before(:each) do
    @destroye_history = assign(:destroye_history, DestroyeHistory.create!(
      :ident_code => "MyString",
      :agent_id => 1,
      :portal_id => 1,
      :resonator_level => 1
    ))
  end

  it "renders the edit destroye_history form" do
    render

    assert_select "form[action=?][method=?]", destroye_history_path(@destroye_history), "post" do

      assert_select "input#destroye_history_ident_code[name=?]", "destroye_history[ident_code]"

      assert_select "input#destroye_history_agent_id[name=?]", "destroye_history[agent_id]"

      assert_select "input#destroye_history_portal_id[name=?]", "destroye_history[portal_id]"

      assert_select "input#destroye_history_resonator_level[name=?]", "destroye_history[resonator_level]"
    end
  end
end
