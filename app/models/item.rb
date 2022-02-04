class Item < ApplicationRecord
    has_many :user
    validates :title, presence: true
    validates :author, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :date, presence: true
end
