require 'rails_helper'

RSpec.describe "capture_histories/new", :type => :view do
  before(:each) do
    assign(:capture_history, CaptureHistory.new(
      :ident_code => "MyString",
      :agent_id => 1,
      :portal_id => 1
    ))
  end

  it "renders new capture_history form" do
    render

    assert_select "form[action=?][method=?]", capture_histories_path, "post" do

      assert_select "input#capture_history_ident_code[name=?]", "capture_history[ident_code]"

      assert_select "input#capture_history_agent_id[name=?]", "capture_history[agent_id]"

      assert_select "input#capture_history_portal_id[name=?]", "capture_history[portal_id]"
    end
  end
end
