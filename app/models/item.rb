# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  weight     :integer          not null
#  calories   :float            not null
#  starts_at  :time             not null
#  ends_at    :time             not null
#  day_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :day

  validates :content, :starts_at, :ends_at,  presence: true
  validates :calories, :weight, numericality: { greater_than: 0 }
end
