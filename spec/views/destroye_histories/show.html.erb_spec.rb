require 'rails_helper'

RSpec.describe "destroye_histories/show", :type => :view do
  before(:each) do
    @destroye_history = assign(:destroye_history, DestroyeHistory.create!(
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
