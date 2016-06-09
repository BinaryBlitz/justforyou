class DeliveryPolicy < ApplicationPolicy
  attr_reader :delivery

  def initialize(current_user, delivery)
    @current_user = current_user
    @delivery = delivery
  end

  def cancel?
    ((delivery.scheduled_for - Time.zone.now) / 1.hour).round > 36
  end
end
