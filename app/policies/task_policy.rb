class TaskPolicy < ApplicationPolicy
  def create?
    user.admin? || user.po? || user.developer?
  end

  def update?
    user.admin? || user.tasks.find(record.id)
  end

  def destroy?
    user.admin?
  end
end