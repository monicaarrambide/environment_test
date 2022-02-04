require 'rails_helper'

RSpec.describe "user_items/new", type: :view do
  before(:each) do
    assign(:user_item, UserItem.new(
      user_id: 1,
      item_id: 1
    ))
  end

  it "renders new user_item form" do
    render

    assert_select "form[action=?][method=?]", user_items_path, "post" do

      assert_select "input[name=?]", "user_item[user_id]"

      assert_select "input[name=?]", "user_item[item_id]"
    end
  end
end
