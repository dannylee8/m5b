class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.string :name
      t.string :role_id

      t.timestamps
    end
  end
end
