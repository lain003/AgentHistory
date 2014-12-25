require 'rails_helper'

RSpec.describe "agents/new", :type => :view do
  before(:each) do
    assign(:agent, Agent.new(
      :name => "MyString",
      :team_id => 1
    ))
  end

  it "renders new agent form" do
    render

    assert_select "form[action=?][method=?]", agents_path, "post" do

      assert_select "input#agent_name[name=?]", "agent[name]"

      assert_select "input#agent_team_id[name=?]", "agent[team_id]"
    end
  end
end
