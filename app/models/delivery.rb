# == Schema Information
#
# Table name: deliveries
#
#  id            :integer          not null, primary key
#  status        :integer          default("pending")
#  scheduled_for :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null

class Delivery < ApplicationRecord
  belongs_to :line_item
  belongs_to :address

  validates :status, :scheduled_for, presence: true

  enum status: %i(pending delivered canceled)

end
