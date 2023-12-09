# == Schema Information
#
# Table name: predictions
#
#  id              :uuid             not null, primary key
#  race_id         :uuid             not null
#  twitter_id      :string           not null
#  is_management   :boolean          default(FALSE), not null
#  is_won          :boolean
#  order           :integer
#  prediction      :jsonb            not null
#  twitter_account :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_predictions_on_race_id                 (race_id)
#  index_predictions_on_race_id_and_twitter_id  (race_id,twitter_id) UNIQUE
#
class Prediction < ApplicationRecord
  belongs_to :race

  validates :prediction, presence: true
  validates :twitter_id, presence: true, uniqueness: { scope: :race_id }
  validates :is_management, inclusion: { in: [true, false] }
  validates :order, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_nil: true

  validate :validate_order_presence
  def validate_order_presence
    if is_management == false && order.nil?
      errors.add(:order, "must be present if is_management is false")
    elsif is_management == true && !order.nil?
      errors.add(:order, "must be nil if is_management is true")
    end
  end
end
