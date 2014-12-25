require 'rails_helper'

RSpec.describe "capture_histories/show", :type => :view do
  before(:each) do
    @capture_history = assign(:capture_history, CaptureHistory.create!(
      :ident_code => "Ident Code",
      :agent_id => 1,
      :portal_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ident Code/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
