# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "has a value" do
    item = Item.new(title: "harry potter", author: "j.k. rowling")
    expect(item).to be_valid
  end

  it "is not valid without a title" do
    item = Item.new(title: nil, author: "j.k. rowling")
    expect(item).to_not be_valid
  end

  it "is not valid without an author" do 
    item = Item.new(title: "harry potter", author: nil)
    expect(item).to_not be_valid
  end
end

# RSpec.describe Item, type: :model do
#   subject do
#     described_class.new(title: 'harry potter', author: 'J.K. Rowling')
#   end

#   it 'is valid with valid attributes - title' do
#     expect(subject).to be_valid
#   end

#   it 'is not valid without a title' do
#     subject.title = nil
#     expect(subject).not_to be_valid
#   end

#   it 'is valid with change valid attributes - title' do
#     subject.title = 'book thief'
#     expect(subject).to be_valid
#   end
# end

# RSpec.describe Item, type: :model do
#   subject do
#     described_class.new(title: 'harry potter', author: 'J.K. Rowling')
#   end

#   it 'is valid with valid attributes - author' do
#     expect(subject).to be_valid
#   end

#   it 'is not valid without an author' do
#     subject.author = nil
#     expect(subject).not_to be_valid
#   end

#   it 'is not valid without title nor author' do
#     subject.title = nil
#     subject.author = nil
#     expect(subject).not_to be_valid
#   end

#   it 'is valid with change to valid attributes - author' do
#     subject.author = 'markus zusak'
#     expect(subject).to be_valid
#   end
# end

# unit test for price
# RSpec.describe Item, type: :model do
#   subject do
#     described_class.new(title: 'harry potter', author: 'J.K. Rowling', price: 5.00)
#   end

#   it 'is valid with valid attributes for price' do
#     expect(subject).to be_valid
#   end

#   it 'is valid with change to valid attributes for price' do
#     price = 4.99
#     expect(subject).to be_valid
#   end

#   it 'is not valid without a proper price' do
#     subject.price = 5.015
#     expect(subject).not_to be_valid
#   end
# end

# unit test for date
# RSpec.describe Item, type: :model do
#   subject do
#     described_class.new(title: 'harry potter', author: 'J.K. Rowling', price: 5.00, date: "%1/%30/%2022")
#   end

#   it 'is valid with valid attributes for date' do
#     expect(subject).to be_valid
#   end

#   it 'is not valid without a proper date' do
#     subject.price = "%13/%20/%2022"
#     expect(subject).not_to be_valid
#   end
# end
