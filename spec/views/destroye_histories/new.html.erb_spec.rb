require 'rails_helper'

RSpec.describe "destroye_histories/new", :type => :view do
  before(:each) do
    assign(:destroye_history, DestroyeHistory.new(
      :ident_code => "MyString",
      :agent_id => 1,
      :portal_id => 1,
      :resonator_level => 1
    ))
  end

  it "renders new destroye_history form" do
    render

    assert_select "form[action=?][method=?]", destroye_histories_path, "post" do

      assert_select "input#destroye_history_ident_code[name=?]", "destroye_history[ident_code]"

      assert_select "input#destroye_history_agent_id[name=?]", "destroye_history[agent_id]"

      assert_select "input#destroye_history_portal_id[name=?]", "destroye_history[portal_id]"

      assert_select "input#destroye_history_resonator_level[name=?]", "destroye_history[resonator_level]"
    end
  end
end
