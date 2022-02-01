require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      title: "MyString",
      author: "MyString",
      price: "9.99"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "input[name=?]", "item[author]"

      assert_select "input[name=?]", "item[price]"
    end
  end
end
