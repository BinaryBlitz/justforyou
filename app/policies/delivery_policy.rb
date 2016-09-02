class DeliveryPolicy < ApplicationPolicy
  def initialize(user, delivery)
    @user = user
    @delivery = delivery
  end

  def cancel?
    create? && @delivery.cancelable?
  end

  def create?
    owner?
  end

  private

  def owner?
    @user == @delivery.user
  end
end
