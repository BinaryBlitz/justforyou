# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  program_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_type_id :integer
#

class Product < ApplicationRecord
  belongs_to :program
  belongs_to :product_type
  has_one    :substitution, dependent: :destroy

  validates :name, presence: true
end
