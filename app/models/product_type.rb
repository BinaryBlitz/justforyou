# == Schema Information
#
# Table name: product_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductType < ApplicationRecord
  validates :name, presence: true
end
