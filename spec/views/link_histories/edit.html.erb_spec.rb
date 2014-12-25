require 'rails_helper'

RSpec.describe "link_histories/edit", :type => :view do
  before(:each) do
    @link_history = assign(:link_history, LinkHistory.create!(
      :ident_code => "MyString",
      :agent_id => 1,
      :to_portal_id => 1,
      :from_portal_id => 1
    ))
  end

  it "renders the edit link_history form" do
    render

    assert_select "form[action=?][method=?]", link_history_path(@link_history), "post" do

      assert_select "input#link_history_ident_code[name=?]", "link_history[ident_code]"

      assert_select "input#link_history_agent_id[name=?]", "link_history[agent_id]"

      assert_select "input#link_history_to_portal_id[name=?]", "link_history[to_portal_id]"

      assert_select "input#link_history_from_portal_id[name=?]", "link_history[from_portal_id]"
    end
  end
end
