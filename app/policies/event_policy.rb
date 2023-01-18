class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def map?
    true
  end

  def filter?
    true
  end

  def edit?
    update?
  end

  def update?
    return false if user.nil?

    record.user == user || user.admin?
  end

  def destroy?
    return false if user.nil?

    record.user == user || user.admin?
  end

end
