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
# Foreign Keys
#
#  fk_rails_f868b47f6a  (user_id => users.id)
#

class Order < ApplicationRecord
  belongs_to :user

  validates :comment, length: { maximum: 1000 }
  include Phonable
end
