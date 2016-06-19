class UserPolicy < ApplicationPolicy
  attr_reader :current_admin, :user

  def initialize(current_admin, user)
    @current_admin = current_admin
    @user = user
  end

  def edit?
    admin?
  end

  def update?
    edit?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    current_admin.type == 'Admin'
  end
end
