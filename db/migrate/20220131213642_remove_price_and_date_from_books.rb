class RemovePriceAndDateFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :price, :float
    remove_column :books, :date, :date
  end
end
