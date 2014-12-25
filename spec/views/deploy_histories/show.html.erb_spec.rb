require 'rails_helper'

RSpec.describe "deploy_histories/show", :type => :view do
  before(:each) do
    @deploy_history = assign(:deploy_history, DeployHistory.create!(
      :ident_code => "Ident Code",
      :agent_id => 1,
      :portal_id => 2,
      :resonator_level => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ident Code/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
