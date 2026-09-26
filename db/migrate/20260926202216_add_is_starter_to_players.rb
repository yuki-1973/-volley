class AddIsStarterToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :is_starter, :boolean
  end
end
