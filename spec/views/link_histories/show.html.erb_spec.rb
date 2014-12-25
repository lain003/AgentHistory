require 'rails_helper'

RSpec.describe "link_histories/show", :type => :view do
  before(:each) do
    @link_history = assign(:link_history, LinkHistory.create!(
      :ident_code => "Ident Code",
      :agent_id => 1,
      :to_portal_id => 2,
      :from_portal_id => 3
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
