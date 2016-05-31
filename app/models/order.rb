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

class Order < ApplicationRecord
  include Phonable

  belongs_to :user

  has_many :line_items, dependent: :destroy

  validates :comment, length: { maximum: 1000 }
  validates :line_items, presence: true
end
