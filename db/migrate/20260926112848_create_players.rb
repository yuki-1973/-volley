class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :number
      t.string :name
      t.string :position
      t.boolean :is_starter

      t.timestamps
    end
  end
end
