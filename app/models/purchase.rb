# == Schema Information
#
# Table name: purchases
#
#  id             :integer          not null, primary key
#  number_of_days :integer          not null
#  program_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :program

  has_many :deliveries, dependent: :destroy

  validates :number_of_days, numericality: { greater_than: 0 }
  validates :program, uniqueness: { scope: :user }
end
