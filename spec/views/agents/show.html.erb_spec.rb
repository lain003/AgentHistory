require 'rails_helper'

RSpec.describe "agents/show", :type => :view do
  before(:each) do
    @agent = assign(:agent, Agent.create!(
      :name => "Name",
      :team_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
