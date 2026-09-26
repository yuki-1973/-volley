class AddStarterToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :starter, :boolean, default: false unless column_exists?(:players, :starter)
  end
end
