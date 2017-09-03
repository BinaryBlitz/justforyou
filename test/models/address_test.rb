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
#  latitude   :float            not null
#  longitude  :float            not null
#  deleted_at :datetime
#  apartment  :integer
#  house      :string
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @address = addresses(:address)
  end

  test 'valid' do
    assert @address.valid?
  end
end
