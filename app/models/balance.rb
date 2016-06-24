# == Schema Information
#
# Table name: balances
#
#  id                                 :integer          not null, primary key
#  lower_days_regular_threshold       :integer          default(31)
#  upper_days_regular_threshold       :integer          default(101)
#  lower_percentage_regular_threshold :integer          default(5)
#  upper_percentage_regular_threshold :integer          default(10)
#  lower_days_periodic_threshold      :integer          default(101)
#  balance_period                     :integer          default(100)
#  periodic_balance_sum               :integer          default(15000)
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

class Balance < ApplicationRecord
end
