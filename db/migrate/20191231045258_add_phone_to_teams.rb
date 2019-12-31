class AddPhoneToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :phone, :string
  end
end
