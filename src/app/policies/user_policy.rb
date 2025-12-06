class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.admin? || user.manager? || record.id == user.id
  end

  def update?
    user.admin? || record.id == user.id
  end

  def show?
    user.admin? || record.id == user.id
  end

  def destroy?
    user.admin? || record.id == user.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.manager?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
