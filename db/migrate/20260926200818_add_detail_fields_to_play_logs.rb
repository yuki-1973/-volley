class AddDetailFieldsToPlayLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :play_logs, :team_type, :string
    add_column :play_logs, :start_x, :float
    add_column :play_logs, :start_y, :float
    add_column :play_logs, :end_x, :float
    add_column :play_logs, :end_y, :float
    add_column :play_logs, :eval_detail, :string
  end
end
