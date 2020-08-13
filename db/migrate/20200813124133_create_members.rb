class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :group, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
