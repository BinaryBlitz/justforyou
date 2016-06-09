class API::DeliveryPolicy < ApplicationPolicy
  attr_reader :delivery

  def initialize(delivery)
    @delivery = delivery
  end

  def cancel?
    ((delivery.scheduled_for - Time.zone.now) / 1.hour).round > 36
  end
end
