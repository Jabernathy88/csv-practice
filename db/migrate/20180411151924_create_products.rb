class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.date :release_date
      t.decimal :price

      t.timestamps
    end
  end
end
