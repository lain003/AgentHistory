require 'rails_helper'

RSpec.describe "agents/index", :type => :view do
  before(:each) do
    assign(:agents, [
      Agent.create!(
        :name => "Name",
        :team_id => 1
      ),
      Agent.create!(
        :name => "Name",
        :team_id => 1
      )
    ])
  end

  it "renders a list of agents" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
