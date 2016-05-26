# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  entrance   :integer
#  floor      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_48c9e0c5a2  (user_id => users.id)
#

class Address < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
end
