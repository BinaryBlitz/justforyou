# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  description     :text             not null
#  duration        :integer          not null
#  primary_price   :integer          not null
#  secondary_price :integer          not null
#  preview_image   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  block_id        :integer
#
# Indexes
#
#  index_programs_on_block_id  (block_id)
#
# Foreign Keys
#
#  fk_rails_166e4b780a  (block_id => blocks.id)
#

class Program < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :block

  validates :name, presence: true, length: { maximum: 20 }
  validates :preview_image, :description, :block, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :primary_price,
            :secondary_price, numericality: { greater_than_or_equal_to: 0 }
end
