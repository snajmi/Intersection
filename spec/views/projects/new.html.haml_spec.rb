require 'spec_helper'

describe "projects/new.html.haml" do
  before(:each) do
    assign(:project, stub_model(Project,
      :description => "MyText",
      :impact_statement => "MyText",
      :active => false
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "textarea#project_impact_statement", :name => "project[impact_statement]"
      assert_select "input#project_active", :name => "project[active]"
    end
  end
end