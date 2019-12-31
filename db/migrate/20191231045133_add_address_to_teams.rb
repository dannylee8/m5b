class AddAddressToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :address, :string
  end
end
