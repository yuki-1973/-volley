class ChangePlayerIdNullableInPlayLogs < ActiveRecord::Migration[7.0]
  def change
    change_column_null :play_logs, :player_id, true
  end
end
