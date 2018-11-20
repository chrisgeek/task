require 'spec_helper'

describe "gigs/new" do
  before(:each) do
    assign(:gig, stub_model(Gig,
      :name => "MyString",
      :description => "MyString",
      :project => nil
    ).as_new_record)
  end

  it "renders new gig form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", gigs_path, "post" do
      assert_select "input#gig_name[name=?]", "gig[name]"
      assert_select "input#gig_description[name=?]", "gig[description]"
      assert_select "input#gig_project[name=?]", "gig[project]"
    end
  end
end
