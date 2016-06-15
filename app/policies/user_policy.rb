class UserPolicy < ApplicationPolicy
  attr_reader :current_admin, :user

  def initialize(current_admin, user)
    @current_admin = current_admin
    @user = user
  end

  def edit?
    current_admin.type == 'Admin'
  end

  def update?
    current_admin.type == 'Admin'
  end

  def destroy?
    current_admin.type == 'Admin'
  end
end
