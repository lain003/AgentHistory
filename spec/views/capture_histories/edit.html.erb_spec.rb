require 'rails_helper'

RSpec.describe "capture_histories/edit", :type => :view do
  before(:each) do
    @capture_history = assign(:capture_history, CaptureHistory.create!(
      :ident_code => "MyString",
      :agent_id => 1,
      :portal_id => 1
    ))
  end

  it "renders the edit capture_history form" do
    render

    assert_select "form[action=?][method=?]", capture_history_path(@capture_history), "post" do

      assert_select "input#capture_history_ident_code[name=?]", "capture_history[ident_code]"

      assert_select "input#capture_history_agent_id[name=?]", "capture_history[agent_id]"

      assert_select "input#capture_history_portal_id[name=?]", "capture_history[portal_id]"
    end
  end
end
