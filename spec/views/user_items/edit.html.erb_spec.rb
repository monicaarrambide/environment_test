require 'rails_helper'

RSpec.describe "user_items/edit", type: :view do
  before(:each) do
    @user_item = assign(:user_item, UserItem.create!(
      user_id: 1,
      item_id: 1
    ))
  end

  it "renders the edit user_item form" do
    render

    assert_select "form[action=?][method=?]", user_item_path(@user_item), "post" do

      assert_select "input[name=?]", "user_item[user_id]"

      assert_select "input[name=?]", "user_item[item_id]"
    end
  end
end
