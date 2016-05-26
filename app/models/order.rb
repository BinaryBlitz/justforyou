# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  phone_number :string           not null
#  comment      :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

class Order < ApplicationRecord
  belongs_to :user

  validates :comment, length: { maximum: 1000 }
  include Phonable
end
