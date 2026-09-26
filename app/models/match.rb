class Match < ApplicationRecord
  belongs_to :team
  has_many :play_logs, dependent: :destroy

  validates :opponent_name, presence: true
  validates :match_date, presence: true

  # --- サーブ効果率 ---
  def serve_effect_rate(set_num = nil)
    logs = filter_logs("サーブ", set_num)
    total = logs.count
    return 0.0 if total == 0

    ace = logs.where(eval_detail: "エース").count
    effect = logs.where(eval_detail: "効果(崩した)").count
    miss = logs.where(eval_detail: "ミス").count

    ((ace * 100.0) + (effect * 25.0) - (miss * 25.0)) / total
  end

  # --- スパイク決定率 (自チーム) ---
  def spike_kill_rate(set_num = nil, target_team = 'own')
    logs = filter_logs("スパイク", set_num).where(team_type: target_team)
    total = logs.count
    return 0.0 if total == 0

    kills = logs.where(eval_detail: "決定").count
    (kills.to_f / total) * 100.0
  end

  # --- レセプション成功率 ---
  def reception_success_rate(set_num = nil)
    logs = filter_logs("レセプション", set_num)
    total = logs.count
    return 0.0 if total == 0

    a_pass = logs.where(eval_detail: "Aパス").count
    b_pass = logs.where(eval_detail: "Bパス").count

    ((a_pass * 100.0) + (b_pass * 50.0)) / total
  end

  private

  def filter_logs(action, set_num)
    scope = play_logs.where(action_type: action)
    scope = scope.where(set_number: set_num) if set_num.present?
    scope
  end
end
