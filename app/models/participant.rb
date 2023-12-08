# == Schema Information
#
# Table name: participants
#
#  id              :uuid             not null, primary key
#  is_won          :boolean
#  prediction      :jsonb            not null
#  twitter_account :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  race_id         :uuid             not null
#  twitter_id      :string           not null
#
# Indexes
#
#  index_participants_on_race_id                 (race_id)
#  index_participants_on_race_id_and_twitter_id  (race_id,twitter_id) UNIQUE
#
class Participant < ApplicationRecord
  belongs_to :race

  validates :prediction, presence: true
  validates :twitter_id, presence: true, uniqueness: { scope: :race_id }
end
