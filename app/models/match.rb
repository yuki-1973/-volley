class Match < ApplicationRecord
  belongs_to :team

  validates :opponent_name, presence: true
  validates :match_date, presence: true
end
