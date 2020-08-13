class CreateAllocs < ActiveRecord::Migration[6.0]
  def change
    create_table :allocs do |t|
      t.references :assign, null: false, foreign_key: true
      t.date :month
      t.integer :cost

      t.timestamps
    end
  end
end
