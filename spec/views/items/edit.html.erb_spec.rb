require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      title: "MyString",
      author: "MyString",
      price: "9.99",
      date: "2022-02-22"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[title]"

      assert_select "input[name=?]", "item[author]"

      assert_select "input[name=?]", "item[price]"
    end
  end
end
