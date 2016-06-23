# == Schema Information
#
# Table name: substitutions
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Substitution < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :product, uniqueness: { scope: :user }
end
