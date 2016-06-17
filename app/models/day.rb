# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  position   :integer          not null
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Day < ApplicationRecord
  belongs_to :program, inverse_of: :days

  has_many :items, dependent: :destroy, inverse_of: :day

  validates :position, presence: true, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :items, allow_destroy: true

  def calories
    items.sum(:calories)
  end
end
