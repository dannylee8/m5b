class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :website
      t.integer :admin

      t.timestamps
    end
  end
end
