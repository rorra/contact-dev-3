require 'spec_helper'

describe "contacts/thank_you.html.erb" do
  it "renders attributes in <p>" do
    render
    
    rendered.should contain("Thank you")
  end
end
