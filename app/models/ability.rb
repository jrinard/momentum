class Ability
  include CanCan::Ability

  def initialize(user)

  user ||= User.new
#### SuperAdmin
  if user.has_role? :superadmin
    can :manage, :all

#### Admin
  elsif user.has_role? :admin
    can :manage, :all

#### STAFF
  elsif user.has_role? :staff
    can :create, Department
    can :update, Department
    # can :destroy, Department
    can :read, :all

#### User
  else
    can :read, :none
  end

# ORIGINAL
  # user ||= User.new
  # if user.has_role? :admin
  #   can :manage, :all
  # elsif user.has_role? :author
  #   can :create, Status # author can create status       #### hange status to object model
  #   can :update, Status # author can update status
  #   # can :destroy, Status # #uncomment this line, author can destroy status
  #   can :read, :all
  # else
  #   can :read, :all
  # end

      #   user ||= User.new # guest user (not logged in)
      #   if user.admin?
      #     can :manage, :all
      #   else
      #     can :read, :all
      #   end

  end
end
