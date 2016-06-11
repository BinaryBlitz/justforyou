# == Schema Information
#
# Table name: promotions
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Promotion < ApplicationRecord
  validates :name, :description, presence: true
end
