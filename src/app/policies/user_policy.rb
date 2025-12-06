class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.admin? || record.id == user.id
  end

  def update?
    user.admin? || record.id == user.id
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
