class ManagerPolicy < ApplicationPolicy
  attr_reader :current_admin, :manager

  def initialize(current_admin, manager)
    @current_admin = current_admin
    @manager = manager
  end

  def index?
    current_admin.type == 'Admin'
  end

  def new?
    current_admin.type == 'Admin'
  end

  def edit?
    current_admin.type == 'Admin'
  end

  def show?
    current_admin.type == 'Admin'
  end

  def create?
    current_admin.type == 'Admin'
  end

  def update?
    current_admin.type == 'Admin'
  end

  def destroy?
    current_admin.type == 'Admin'
  end
end
