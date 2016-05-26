# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_products_on_program_id  (program_id)
#

class Product < ApplicationRecord
  belongs_to :program

  validates :name, presence: true
end
