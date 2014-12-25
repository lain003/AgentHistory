require 'rails_helper'

RSpec.describe "agents/edit", :type => :view do
  before(:each) do
    @agent = assign(:agent, Agent.create!(
      :name => "MyString",
      :team_id => 1
    ))
  end

  it "renders the edit agent form" do
    render

    assert_select "form[action=?][method=?]", agent_path(@agent), "post" do

      assert_select "input#agent_name[name=?]", "agent[name]"

      assert_select "input#agent_team_id[name=?]", "agent[team_id]"
    end
  end
end
