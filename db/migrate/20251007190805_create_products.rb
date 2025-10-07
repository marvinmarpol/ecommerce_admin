class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.integer :stock
      t.datetime :published_at
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
