class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :team, null: false, foreign_key: true
      t.string :opponent_name
      t.date :match_date
      t.string :status
      t.integer :total_sets

      t.timestamps
    end
  end
end
