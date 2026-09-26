class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :play_logs, dependent: :destroy
end
