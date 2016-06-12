# == Schema Information
#
# Table name: deliveries
#
#  id            :integer          not null, primary key
#  status        :integer          default("pending")
#  scheduled_for :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  line_item_id  :integer
#

class Delivery < ApplicationRecord
  belongs_to :line_item

  validates :status, :scheduled_for, presence: true

  enum status: %i(pending delivered canceled)

end
