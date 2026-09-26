class Match < ApplicationRecord
  belongs_to :team
  has_many :play_logs, dependent: :destroy

  validates :opponent_name, presence: true
  validates :match_date, presence: true
end
