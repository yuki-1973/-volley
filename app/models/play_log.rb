class PlayLog < ApplicationRecord
  belongs_to :match
  belongs_to :player, optional: true

  validates :set_number, presence: true
  validates :action_type, presence: true

  # チーム区分 (own: 自チーム, opponent: 相手チーム)
  enum team_type: { own: 'own', opponent: 'opponent' }, _prefix: true
end
