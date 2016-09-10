class SubstitutionPolicy < ApplicationPolicy
  def initialize(user, substitution)
    @user = user
    @substitution = substitution
  end

  def create?
    @user == @substitution.user
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
