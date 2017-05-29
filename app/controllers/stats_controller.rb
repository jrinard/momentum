class StatsController < ApplicationController

  def index
    @user = current_user
    @units = Unit.all
    @units7 = User.where("date(created_at) > ?", 6.days.ago).count
    @units30 = User.where("date(created_at) > ?", 30.days.ago).count
    @units365 = User.where("date(created_at) > ?", 365.days.ago).count
    @parts = Part.all
    @parts7 = User.where("date(created_at) > ?", 6.days.ago).count
    @parts30 = Part.where("date(created_at) > ?", 30.days.ago).count
    @parts365 = Part.where("date(created_at) > ?", 365.days.ago).count
    @users = User.all
  end

end
