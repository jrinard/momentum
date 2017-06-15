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

    @events = Event.all
    @spectators = Spectator.all


    @chart1 = Spectator.group_by_day(:created_at).count

    @current_year = Time.new.year
    @spectactors_year = Spectator.where("date(created_at) > ?", 365.days.ago).count
    # @sunday_average = Spectactor.
    # @test = @Spectators.group("year(created_at)").group("month(created_at)").count
    # @events.spectators.count(:group => "year(created_at),month(created_at)")
    # @test = Spectator.group_by_year(:created_at).count

    # @thisweek = Spectator.where("date(created_at) > ?", 6.days.ago).count
    d = Date.today
    @startweek = d.at_beginning_of_week.strftime("%b %d")
    @endweek = d.at_end_of_week.strftime("%d")

    @serving_average = Spectator.count / Event.count

    lastweek = Date.today.at_beginning_of_week - 7
    @startlastweek = lastweek.strftime("%b %d")
    endlastweek = Date.today.at_beginning_of_week - 1
    @endlastweek = endlastweek.strftime("%d")

    @adultthisweek = Date.today.at_beginning_of_week

    # @test = Spectator.where(:val => 5).group('week(created_at)').count
    # @test = Date.today.strftime("%U").to_i
    @countunits = Unit.top(:familyname).count
    @test = Spectator.top(:created_at).count
end

end
