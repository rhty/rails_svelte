# == Schema Information
#
# Table name: restrictions
#
#  id          :uuid             not null, primary key
#  description :text             not null
#  format      :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Restriction < ApplicationRecord
  has_many :races, dependent: :destroy
end
