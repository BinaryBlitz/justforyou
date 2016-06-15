class ManagerPolicy < ApplicationPolicy
  attr_reader :current_admin, :manager

  def initialize(current_admin, manager)
    @current_admin = current_admin
    @manager = manager
  end

  def index?
    admin?
  end

  def new?
    admin?
  end

  def edit?
    admin?
  end

  def show?
    admin?
  end

  def create?
    new?
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
