require 'spec_helper'

describe "gigs/show" do
  before(:each) do
    @gig = assign(:gig, stub_model(Gig,
      :name => "Name",
      :description => "Description",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(//)
  end
end
