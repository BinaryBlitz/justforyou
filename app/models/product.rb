# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_type_id :integer
#

class Product < ApplicationRecord
  belongs_to :product_type

  has_many :substitutions, dependent: :destroy

  validates :name, presence: true
end
