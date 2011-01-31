require 'spec_helper'

describe "line_items/index.html.erb" do
  before(:each) do
    assign(:line_items, [
      stub_model(LineItem,
        :product_id => 1,
        :cart_id => 1
      ),
      stub_model(LineItem,
        :product_id => 1,
        :cart_id => 1
      )
    ])
  end

  it "renders a list of line_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
