class OrderPolicy < ApplicationPolicy
  def initialize(user, order)
    @user = user
    @order = order
  end

  def create?
    @user == @order.user
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
