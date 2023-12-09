# == Schema Information
#
# Table name: races
#
#  id             :uuid             not null, primary key
#  restriction_id :uuid             not null
#  name           :string           not null
#  deadline       :datetime         not null
#  held_at        :datetime         not null
#  horses_count   :integer          not null
#  status         :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_races_on_restriction_id  (restriction_id)
#
class Race < ApplicationRecord
  belongs_to :restriction
  has_one :race_result, dependent: :destroy
  has_many :predictions, dependent: :destroy

  enum status: {
    not_started: 0,
    open: 1,
    pre_race: 2,
    post_race: 3,
    closed: 4,
    aborted: 5,
  }

  validates :name, presence: true
  validates :deadline, presence: true
  validates :held_at, presence: true
  validates :horses_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
