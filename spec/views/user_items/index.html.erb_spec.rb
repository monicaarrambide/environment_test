require 'rails_helper'

RSpec.describe "user_items/index", type: :view do
  before(:each) do
    assign(:user_items, [
      UserItem.create!(
        user_id: 2,
        item_id: 3
      ),
      UserItem.create!(
        user_id: 2,
        item_id: 3
      )
    ])
  end

  it "renders a list of user_items" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
