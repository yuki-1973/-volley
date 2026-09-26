class CreatePlayLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :play_logs do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :set_number
      t.string :action_type
      t.string :result

      t.timestamps
    end
  end
end
