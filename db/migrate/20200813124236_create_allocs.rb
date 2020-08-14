class CreateAllocs < ActiveRecord::Migration[6.0]
  def change
    create_table :allocs do |t|
      t.references :assign, null: false, foreign_key: true
      t.date :month
      t.decimal :cost, precision: 6, scale: 2

      t.timestamps
    end
  end
end
