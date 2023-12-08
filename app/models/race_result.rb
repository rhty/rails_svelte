# == Schema Information
#
# Table name: race_results
#
#  id          :uuid             not null, primary key
#  race_id     :uuid             not null
#  result_data :jsonb            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_race_results_on_race_id  (race_id)
#
class RaceResult < ApplicationRecord
  belongs_to :race

  validates :result_data, presence: true
end
