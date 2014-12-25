require 'rails_helper'

RSpec.describe "deploy_histories/edit", :type => :view do
  before(:each) do
    @deploy_history = assign(:deploy_history, DeployHistory.create!(
      :ident_code => "MyString",
      :agent_id => 1,
      :portal_id => 1,
      :resonator_level => 1
    ))
  end

  it "renders the edit deploy_history form" do
    render

    assert_select "form[action=?][method=?]", deploy_history_path(@deploy_history), "post" do

      assert_select "input#deploy_history_ident_code[name=?]", "deploy_history[ident_code]"

      assert_select "input#deploy_history_agent_id[name=?]", "deploy_history[agent_id]"

      assert_select "input#deploy_history_portal_id[name=?]", "deploy_history[portal_id]"

      assert_select "input#deploy_history_resonator_level[name=?]", "deploy_history[resonator_level]"
    end
  end
end
