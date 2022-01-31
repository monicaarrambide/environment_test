class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.float :price
      t.date :date

      t.timestamps
    end
  end
end
