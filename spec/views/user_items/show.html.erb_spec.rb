require 'rails_helper'

RSpec.describe "user_items/show", type: :view do
  before(:each) do
    @user_item = assign(:user_item, UserItem.create!(
      user_id: 2,
      item_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
