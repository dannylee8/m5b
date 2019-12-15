class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.references :team, index: true, foreign_key: true
      t.string :name
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
