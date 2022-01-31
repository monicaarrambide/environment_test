# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
end


RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'J.K. Rowling')
  end

  it 'is valid with valid attributes - author' do
    expect(subject).to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end
end

# unit test for price
RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'J.K. Rowling', price: 5.00)
  end

  it 'is valid with valid attributes for price' do
    expect(subject).to be_valid
  end

  it 'is not valid without a proper price' do
    subject.price = 5.015
    expect(subject).not_to be_valid
  end
end

# unit test for date
RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'J.K. Rowling', price: 5.00, date: "%1/%30/%2022")
  end

  it 'is valid with valid attributes for date' do
    expect(subject).to be_valid
  end

  it 'is not valid without a proper date' do
    subject.price = "%13/%20/%2022"
    expect(subject).not_to be_valid
  end
end
