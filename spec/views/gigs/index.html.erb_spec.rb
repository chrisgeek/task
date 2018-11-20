require 'spec_helper'

describe "gigs/index" do
  before(:each) do
    assign(:gigs, [
      stub_model(Gig,
        :name => "Name",
        :description => "Description",
        :project => nil
      ),
      stub_model(Gig,
        :name => "Name",
        :description => "Description",
        :project => nil
      )
    ])
  end

  it "renders a list of gigs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
