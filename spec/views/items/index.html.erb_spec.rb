require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        title: "Title",
        author: "Author",
        price: "9.99",
        date: "2022-02-22"
      ),
      Item.create!(
        title: "Title",
        author: "Author",
        price: "9.99",
        date: "2022-02-22"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Author".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
