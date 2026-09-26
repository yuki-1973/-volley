class PlayLog < ApplicationRecord
  belongs_to :match
  belongs_to :player

  validates :set_number, presence: true
  validates :action_type, presence: true
  validates :result, presence: true
end
